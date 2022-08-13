def add_template_repository_to_source_path
  if __FILE__ =~ %r{\Ahttps?://}
    require "tmpdir"
    source_paths.unshift(tempdir = Dir.mktmpdir("rails-template-"))
    at_exit { FileUtils.remove_entry(tempdir) }
    git clone: [
      "--quiet",
      "https://github.com/Bellatrix988/rails-template.git",
      tempdir
    ].map(&:shellescape).join(" ")

    if (branch = __FILE__[%r{rails-template/(.+)/template.rb}, 1])
      Dir.chdir(tempdir) { git checkout: branch }
    end
  else
    source_paths.unshift(File.dirname(__FILE__))
  end
end

def db_setup
  rails_command('db:create')
  rails_command('db:migrate')
  rails_command('db:seed')
end

def init_gems
  # Gemfile
  template "Gemfile.tt", 'Gemfile', force: true

  # Annotate gems in Gemfile an installing gems via bundle
  run 'gem install annotate_gem'
  run 'annotate-gem --new-comments-only'
  run 'bundle install'

  # Initial generation for gems
  generate 'simple_form:install --bootstrap'
  copy_file 'config/initializers/simple_form_bootstrap.rb', force: true
  generate 'rspec:install'
  generate 'devise:install'
end

def optional_questions
  if yes? 'Do you wish to init devise user? (y/n)'
    generate 'devise user', 'first_name:string', 'last_name:string', 'role:integer'
    copy_file 'spec/factories/users.rb', force: true
    copy_file 'db/seeds.rb', force: true
    template 'config/locales/en.yml.tt', force: true
  end

  if yes? 'Do you wish to generate a root controller? (y/n)'
    name = ask('What do you want to call it? [dashboard]').to_s.underscore
    name = 'dashboard' if name.blank?
    generate :controller, "#{name} index"
    directory 'app', force: true
    route "root to: '#{name}\#index'"
    route "resource :#{name}, controller: :#{name}, only: :index"
  end

  # Add BaseService
  if yes? 'Do you wanna init ServiceObject? (y/n)'
    file 'app/services/base_service.rb', <<-CODE
      class BaseService
        class << self
          def call(*args)
            new(*args).call
          end
        end
      end
    CODE
  end
end

def after_commit
  after_bundle do
    git :init
    git add: "."
    git commit: %Q{ -m 'Initial commit' }
  end
end

add_template_repository_to_source_path
init_gems
optional_questions
db_setup


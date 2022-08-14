# Rails Application Template with Bootstrap

These files contains the most usable gems and configuration for the initial setup
of a plain Rails-application.

Since Rails provides [templates](https://guides.rubyonrails.org/rails_application_templates.html)
for adding gems, initializers, etc. to your freshly created Rails project or an existing Rails project,
I collected the most loved gems and configuration I'd like to share.

To find more suitable gem for special case I like using [The Ruby Toolbox](https://www.ruby-toolbox.com/projects/statistics) site.

* [Installation](#installation)
  * [new project](#for-a-new-project)
  * [existing project](#for-an-existing-project)
* [Gems list](#list-of-gems)

## Requirements

* PostgreSQL
* Rails 7
* Ruby 3.1.2

## Usage

To apply this template for any new project you create, put the `.railsrc` file in your `$HOME`
directory.

```shell
cd $HOME
curl https://raw.githubusercontent.com/Bellatrix988/rails-template/main/.railsrc --output .railsrc
```

## For a new project
Simple user standard command for creation new application.
`rails new app_name`
## For an existing project
```shell
bin/rails app:template LOCATION=https://raw.githubusercontent.com/Bellatrix988/rails-template/main/template.rb

```
## List of Gems
* [Devise](https://github.com/heartcombo/devise)
* [Enumerize](https://github.com/brainspec/enumerize)
* 
* Frontend
  * [Simple Form](https://github.com/heartcombo/simple_form)
* Unils
  * [Rubocop](https://github.com/rubocop/rubocop)  
  * [Annotate gem](https://github.com/ivantsepp/annotate_gem) - is command line tool that will add useful comments to your Gemfile.
* Testing
  * [Rspec-rails](https://github.com/rspec/rspec-rails)
  * [FactoryBot](https://github.com/thoughtbot/factory_bot)
  * [Faker](https://github.com/faker-ruby/faker)
  * [Database Cleaner](https://github.com/DatabaseCleaner/database_cleaner)




# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    email { Faker::Internet.email(name: first_name + last_name, separators: '+', domain: 'example') }
    password { 'password' }
    confirmed_at { DateTime.now }
    role { :user }
  end

  factory :admin, parent: :user do
    role { :admin }
  end

  factory :default_admin, parent: :admin do
    first_name { 'Admin' }
    last_name { 'Super' }
    email { 'admin@example.com' }
  end
end

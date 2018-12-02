# frozen_string_literal: true

FactoryGirl.define do
  factory :superadmin, class: User do
    first_name 'Robert'
    last_name 'Saunders'
    email 'superadmin@example.com'
    password 'password'
    role 'superadmin'
  end

  factory :student, class: User do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    email { Faker::Internet.email }
    password 'password'
    role 'student'
  end

  factory :regular, class: User do
    first_name 'Regular'
    last_name 'User'
    email 'regular@example.com'
    password 'password'
    role 'student'
  end
end

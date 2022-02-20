# frozen_string_literal: true

FactoryBot.define do
  factory :john_smith, class: User do
    id { 1 }
    first_name { 'John' }
    last_name { 'Smith' }
    email { 'johnsmith@example.com' }
    password { 'password123' }
    username { 'johnsmith' }
  end
end

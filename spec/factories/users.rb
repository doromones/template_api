# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "email-#{n}@example.com" }
    password { 'password' }
    password_confirmation { 'password' }

    current_sign_in_at { nil }
  end
end

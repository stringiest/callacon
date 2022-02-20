# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Authentication', type: :feature do
  scenario 'user logs in successfully' do
    create_user_in_test_db
    login_successfully

    expect(current_path).to eq('/')
    expect(page).to have_content('Signed in successfully')
  end

  scenario 'user enters incorrect email' do
    create_user_in_test_db

    visit('/sessions/new')

    fill_in('email', with: 'wrongEmail@example.com')
    fill_in('password', with: 'password123')
    click_button('Sign In')

    expect(current_path).to eq('/sessions')
    expect(page).to have_content('Invalid login details')
  end

  scenario 'user enters incorrect password' do
    create_user_in_test_db

    visit('/sessions/new')

    fill_in('email', with: 'john@example.com')
    fill_in('password', with: 'wrongPassword')
    click_button('Sign In')

    expect(current_path).to eq('/sessions')
    expect(page).to have_content('Invalid login details')
  end
end

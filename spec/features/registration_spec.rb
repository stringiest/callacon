require 'rails_helper'

RSpec.feature "Registration", :type => :feature do
  xscenario 'user signs up successfully' do
    visit('/users/new')

    fill_in('username', with: 'jane1')
    fill_in('first_name', with: 'Jane')
    fill_in('last_name', with: 'Smith')
    fill_in('email', with: 'jane@example.com')
    fill_in('password', with: 'password')
    fill_in('password confirmation', with: 'password')
    click_button('Sign Up')

    expect(current_path).to eq('/sessions/new')
    expect(page).to have_content('Successfully signed up')
  end

  xscenario "user's passwords do not match" do
    visit('/users/new')

    fill_in('username', with: 'jane1')
    fill_in('first_name', with: 'Jane')
    fill_in('last_name', with: 'Smith')
    fill_in('email', with: 'jane@example.com')
    fill_in('password', with: 'password')
    fill_in('password confirmation', with: 'password2')
    click_button('Sign Up')

    expect(current_path).to eq('/users')
    expect(page).to have_content("Password confirmation doesn't match Password")
  end

  xscenario 'username is taken' do
    create_user_in_test_db

    visit('/users/new')

    fill_in('username', with: 'john1')
    fill_in('first_name', with: 'John')
    fill_in('last_name', with: 'Smith')
    fill_in('email', with: 'john@test.com')
    fill_in('password', with: 'password')
    fill_in('password confirmation', with: 'password')
    click_button('Sign Up')

    expect(current_path).to eq('/users')
    expect(page).to have_content('Username has already been taken')
  end

  xscenario 'email is taken' do
    create_user_in_test_db

    visit('/users/new')

    fill_in('username', with: 'johns')
    fill_in('first_name', with: 'John')
    fill_in('last_name', with: 'Smith')
    fill_in('email', with: 'john@example.com')
    fill_in('password', with: 'password')
    fill_in('password confirmation', with: 'password')
    click_button('Sign Up')

    expect(current_path).to eq('/users')
    expect(page).to have_content('Email already registered')
  end
end

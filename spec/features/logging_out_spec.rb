# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Logging out', type: :feature do
  scenario 'user is logged in, then logs out' do
    create_user_in_test_db
    login_successfully

    click_link('Sign Out')

    expect(current_path).to eq('/sessions/new')
    expect(page).to have_content('Successfully signed out')
  end
end

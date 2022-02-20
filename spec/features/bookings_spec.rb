require 'rails_helper'

RSpec.feature "Bookings", :type => :feature do
  context 'logged in user' do
    before :each do
      create_user_in_test_db
      login_successfully
      make_booking
    end

    scenario 'user can sign in and make a booking' do
      expect(current_path).to eq('/bookings')
      expect(page).to have_content('01/11/2021')
      expect(page).to have_content('08/11/2021')
    end

    scenario 'user can edit a booking' do
      click_link('Edit')
      fill_in('Arrival Date', with: '04/11/2021')

      click_button('Submit')

      expect(current_path).to eq('/bookings')
      expect(page).to have_content('04/11/2021')
      expect(page).to have_content('08/11/2021')
    end

    xscenario 'user can delete a booking' do
      click_link('Delete')
      click_link('ok')
    
      expect(current_path).to eq('/bookings')
      expect(page).not_to have_content('2021-11-01')
      expect(page).not_to have_content('2021-11-08')
    end
  end

  context 'non-signed in user' do
    scenario 'user cannot make a booking if not signed in' do
      visit('/bookings')

      expect(page).to have_no_link('New Booking')
    end
  end
end

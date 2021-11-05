def create_user_in_test_db
  User.create(
      username: 'john1',
      first_name: 'John',
      last_name: 'Smith',
      email: 'john@example.com',
      password: 'password123',
      password_confirmation: 'password123'
    )
end

def login_successfully
  visit('/sessions/new')

  fill_in('email', with: 'john@example.com')
  fill_in('password', with: 'password123')
  click_button('Sign In')
end

def login_and_make_booking
  create_user_in_test_db
  login_successfully

  click_link('New Booking')

  fill_in('arrival date', with: '01/11/2021')
  fill_in('departure date', with: '08/11/2021')

  click_button('Submit')
end
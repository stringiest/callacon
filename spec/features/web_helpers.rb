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
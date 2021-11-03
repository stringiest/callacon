class User < ApplicationRecord
  has_secure_password
  validates :username, uniqueness: true
  validates :email, uniqueness: { message: 'already registered' }

  def email=(value)
    value = value.strip.downcase
    write_attribute :email, value
  end
end

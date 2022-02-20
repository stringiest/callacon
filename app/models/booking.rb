require 'cost_calculator'

class Booking < ApplicationRecord
  belongs_to :user

  before_save do |booking|
    cost = CostCalculator.new(booking)
    self.cost = cost.calculate
  end
end

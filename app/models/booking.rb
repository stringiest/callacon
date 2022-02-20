require 'cost_calculator'

class Booking < ApplicationRecord
  belongs_to :user

  before_save do |booking|
    puts "booking"
    puts booking
    puts "in the after_create method"
    cost = CostCalculator.new(booking)
    puts "***********************************"
    puts "cost.calculate"
    puts cost.calculate
    self.cost = cost.calculate
  end
end

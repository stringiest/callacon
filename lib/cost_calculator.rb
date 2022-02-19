module CostCalculator
  def initialize(booking)
    @booking = booking
  end

  def cost_calculator
    # £50 initial fee, plus £35 per night for Mon - Sat night, £20 per night for Sun
    if @booking.departure.strftime(%a) == 'Sun'
      cost = 50 + 35 * (@booking.departure - @booking.arrival) + 20
    else
      cost = 50 + 35 * (@booking.departure - @booking.arrival + 1)
    end
  end
end
class CostCalculator
  def initialize(booking)
    @booking = booking
  end

  def calculate
    # £50 initial fee, plus £35 per night for Mon - Sat night, £20 per night for Sun
    # straight subtraction doesn't return integer days in current format
    # how do I return integer days?
    if @booking.departure.strftime("%w") == 6
      total = (50 + 35 * (@booking.departure - @booking.arrival).to_i + 20) * 100
    else
      total = (50 + 35 * ((@booking.departure - @booking.arrival).to_i + 1)) * 100
    end
    total
  end
end
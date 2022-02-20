# frozen_string_literal: true

class CostCalculator
  # store all currency amounts in pence in the database
  def initialize(booking)
    @booking = booking
  end

  def calculate
    if @booking.departure.strftime('%u') == '1'
      total = ((50 + (35 * (number_of_nights - 1)) + 20 + single_person_supplement) /
              assistance_claim + donation) * 100
    else
      total = ((50 + (35 * number_of_nights) + single_person_supplement) /
              assistance_claim + donation) * 100
    end
    total
  end

  private

  def number_of_nights
    (@booking.departure - @booking.arrival).to_i
  end

  def assistance_claim
    @booking.assistance == TRUE ? 2 : 1
  end

  def donation
    @booking.donation
  end

  def single_person_supplement
    # 50 per night, capped at 200 (i.e. price stops increasing after 4 nights)
    if @booking.sps == true
      number_of_nights > 3 ? 200 : number_of_nights * 50
    else
      0
    end
  end
end

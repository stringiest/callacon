class DashboardController < ApplicationController
  def index
    @bookings = Booking.where(["user_id = #{session[:user_id]}"])
    @games = Game.where(["user_id = #{session[:user_id]}"])
  end
end
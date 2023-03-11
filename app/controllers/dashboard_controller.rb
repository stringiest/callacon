class DashboardController < ApplicationController
  def index
    if session[:user_id] != nil
      @bookings = Booking.where(["user_id = #{session[:user_id]}"])
      @games = Game.where(["user_id = #{session[:user_id]}"])
    else
      redirect_to new_session_path
    end
  end
end
class BookingsController < ApplicationController
  before_action :find_booking, only: [:show, :edit, :update, :destroy]

  def index
    @bookings = Booking.all
  end

  def show
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(user_id: session[:user_id], arrival: params[:booking][:arrival], departure: params[:booking][:departure])
    if @booking.save
      redirect_to bookings_url
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @booking.update(booking_params)
      redirect_to bookings_url
    else
      render 'edit'
    end
  end

  def destroy
    @booking.destroy
    redirect_to bookings_url
  end

  private

  def find_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:arrival, :departure)
  end
end

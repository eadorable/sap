class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
  end

  def show
  end

  def dashboard
    # @bookings = current_user.bookings
    @bookings = Booking.where(participant: current_user)
    @activities = current_user.activities
  end

  # def dashboard
  #   @cars = current_user.cars
  #   @orders = current_user.orders
  # end
end

class BookingsController < ApplicationController
  def show
    @booking = Booking.find(params[:id])
  end

  def create
    @activity = Activity.find(params[:activity_id])

    @booking = Booking.new(activity: @activity, participant: current_user)
    if @booking.save!
      redirect_to booking_path(@booking)
    else
      render "activities/show"
    end
  end
end

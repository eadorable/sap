class BookingsController < ApplicationController
  def create
    @activity = Activity.find(params[:activity_id])

    @booking = Booking.new(activity: @activity, participant: current_user)
    # @booking.activity = @activity
    # @booking.user = current_user
    if @booking.save!
      redirect_to activity_path(@activity)
    else
      render "activities/show"
    end
  end
end

class BookingsController < ApplicationController
  def index
    # @bookings = Booking.where(activity: @my_activities)
    @bookings = Booking.joins(activity: :owner).where(activities: { owner: current_user }, bookings: { status: nil })
  end

  def accept
    @booking = Booking.find(params[:id])
    @booking.update(status: true)
    # redirect_to activity_bookings_path(@booking.activity)
    redirect_to dashboard_path
  end

  def decline
    @booking = Booking.find(params[:id])
    @booking.update(status: false)
    # redirect_to activity_bookings_path(@booking.activity)
    redirect_to dashboard_path
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def create
    @activity = Activity.find(params[:activity_id])
    @booking = Booking.new(activity: @activity, participant: current_user, status: nil)
    if @booking.save!
      redirect_to activity_path(@activity)
    else
      render "activities/show"
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to activity_path(@booking.activity)
  end
end

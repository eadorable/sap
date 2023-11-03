class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
  end

  def show
  end

  def dashboard
    @my_activities = Activity.where(owner: current_user)
    @my_bookings = Booking.where(participant: current_user)
    @participants_booked = Booking.joins(activity: :owner).where(activities: { owner: current_user }, bookings: { status: true })
    @participants_pending = Booking.joins(activity: :owner).where(activities: { owner: current_user }, bookings: { status: nil })
    @participants_declined = Booking.joins(activity: :owner).where(activities: { owner: current_user }, bookings: { status: false })

    # activity that I own and that have bookings
    @my_activity_bookings = Booking.joins(activity: :owner).where(activities: { owner: current_user })
  end
end

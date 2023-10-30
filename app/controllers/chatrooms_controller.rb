class ChatroomsController < ApplicationController
  before_action :authenticate_user!

  def index
    @chatrooms = Chatroom.all
  end

  def show
    @activity = Activity.find(params[:id])
    @activities_booked = current_user.bookings.where(status: true)
    # looking for the booking of the current user that is approved and has the activity of the current page
    @activity_booked = @activities_booked.find_by(activity_id: @activity.id)
    @chatroom = @activity.chatroom
    @message = Message.new
  end
end

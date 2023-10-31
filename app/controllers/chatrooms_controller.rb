class ChatroomsController < ApplicationController
  before_action :authenticate_user!

  def index
    # Lets find all the activities where I am the owner
    @my_activities = Activity.where(owner: current_user).pluck(:id)
    # Lets find all the booking that I am aproved and the ids of the acitivity
    @my_booked_activities = current_user.bookings.where(status: true).pluck(:activity_id)
    @final_ids = []
    # Empty array
    @final_ids.concat(@my_activities, @my_booked_activities)
    # Joining the ids where i am the owner where I am the owner and participant
    @chatrooms = Chatroom.where(activity_id: @final_ids)
    # with these of array we retrive all the chatrooms where I am the owner and participant
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

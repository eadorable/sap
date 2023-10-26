class ActivitiesController < ApplicationController
  before_action :set_activity, only: [:show]

  def index
    @activities = Activity.all
    @categories = Category.all

    if params[:query].present?
      @activities = Activity.all.global_search(params[:query])
    end

    if params[:category_id].present?
      @activities = @activities.where(category_id: params[:category_id])
    end
  end

  def show
    @activity = Activity.find(params[:id])
    @activity_coordinates = [@activity.latitude, @activity.longitude]
    @markers = geocoded_activity_markers
    @booking = Booking.new

    @chatroom = @activity.chatroom
    @message = Message.new
  end

  def new
    @activity = Activity.new
  end

  def create
    @activity = Activity.new(activity_params)
    @activity.owner = current_user
    @activity.chatroom = Chatroom.new

    if @activity.save
      redirect_to activities_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def activity_params
    params.require(:activity).permit(:name, :address, :date_time, :description, :difficulty, :equipment, :category_id,
                                     :owner_id)
  end

  def set_activity
    @activity = Activity.find_by(id: params[:id])
  end

  def geocoded_activity_markers
    geocoded_activities = Activity.all
    geocoded_activities.map do |activity|
      {
        lat: activity.latitude,
        lng: activity.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: { activity: activity }),
        marker_html: render_to_string(partial: "marker", locals: { activity: activity, address: activity.address })
      }
    end
  end
end

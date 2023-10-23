class ActivitiesController < ApplicationController
  before_action :set_activity, only: [:show]

  def index
    @activities = Activity.all
    @markers = geocoded_activity_markers

    if params[:query].present?
      @activities = Activity.all.global_search(params[:query])
    end
  end

  def show
    @activity = Activity.find(params[:id])
    @activity_coordinates = [@activity.latitude, @activity.longitude]
    @booking = Booking.new
  end

  def new
    @activity = Activity.new
  end

  def create
    @activity = Activity.new(activity_params)
    @activity.owner = current_user

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
    geocoded_activities = Activity.geocoded
    geocoded_activities.map do |activity|
      {
        lat: activity.latitude,
        lng: activity.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: { activity: activity }),
        marker_html: render_to_string(partial: "marker", locals: { activity: activity })
      }
    end
  end
end

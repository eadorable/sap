class ActivitiesController < ApplicationController
  before_action :set_activity, only: [:show]

  def index
    if params[:tag].present?
      @category_id = Category.find_by(name: params[:tag]).id
      @activities = Activity.where(category_id: @category_id)
    else
      @activities = Activity.all
    end
    
    @categories = Category.all
    @categories_name = Category.all.pluck(:name)
    if params[:query].present?
      @activities = Activity.all.global_search(params[:query])
    end

    if params[:category_id].present?
      @activities = @activities.where(category_id: params[:category_id])
    end
  end

  def show
    @activity = Activity.find(params[:id])
    # @activity_coordinates = [@activity.latitude, @activity.longitude]
    @markers = geocoded_activity_markers(@activity)
    @booking = Booking.new

    # Fetch additional activities for display. It will only display 3 activities
    # @activities = Activity.where.not(id: @activity.id).limit(3)
    @activities = Activity.where.not(id: @activity.id).order("RANDOM()").limit(3)
  end

  def new
    @activity = Activity.new
  end

  def create
    @activity = Activity.new(activity_params)
    @activity.owner = current_user
    if @activity.save
      @activity.geocode
      redirect_to activities_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @activity = Activity.find(params[:id])
  end

  def update
    @activity = Activity.find(params[:id])
    @activity.update(activity_params)
    redirect_to activity_path(@activity)
  end

  def destroy
    @activity = Activity.find(params[:id])
    @activity.destroy
    redirect_to dashboard_path
  end

  private

  def activity_params
    params.require(:activity).permit(:name, :address, :date_time, :description, :difficulty, :equipment, :category_id,
                                    :owner_id, photos: [])
  end

  def set_activity
    @activity = Activity.find_by(id: params[:id])
  end

  def geocoded_activity_markers(activity)
    return [] unless activity.present?

    [{
      lat: activity.latitude,
      lng: activity.longitude,
      info_window_html: render_to_string(partial: "info_window", locals: { activity: activity }),
      marker_html: render_to_string(partial: "marker", locals: { activity: activity })
    }]
  end
end

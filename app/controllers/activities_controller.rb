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
    @markers = geocoded_activity_markers(@activity)
    @booking = Booking.new
    # Fetch additional activities for display. It will only display 3 activities
    @activities = Activity.where.not(id: @activity.id).order("RANDOM()").limit(3)
    @activity_booked = current_user.bookings.where(status: true).find_by(activity_id: @activity.id)
    @activity_pending = current_user.bookings.where(status: nil).find_by(activity_id: @activity.id)
    @activity_declined = current_user.bookings.where(status: false).find_by(activity_id: @activity.id)
    @accepted_participants = @activity.participants.select { |participant| participant.bookings.find_by(activity_id: @activity.id).status === true }
    @chatroom = @activity.chatroom
    @message = Message.new
    @bookings = @activity.bookings.where(status: true)
  end

  def new
    @activity = Activity.new
  end

  def create
    @activity = Activity.new(activity_params)
    @activity.owner = current_user
    @activity.chatroom = Chatroom.new
    if @activity.save
      @activity.geocode
      redirect_to activity_path(@activity)
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

  def show_details
    @activity = Activity.find(params[:id])
    @accepted_participants = @activity.participants.select { |participant| participant.bookings.find_by(activity_id: @activity.id).status === true }
    respond_to do |format|
      format.html do
        # Render an HTML template or redirect to a different page
        # You can add code here to render an HTML template or perform other actions.
      end
      format.json do
        # Respond with JSON data for API requests
        render json: { activity: @activity, participants: @accepted_participants }
      end
    end
  end

  private

  def activity_params
    params.require(:activity).permit(:name, :address, :date_time, :max_count, :description, :difficulty, :equipment, :category_id,
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

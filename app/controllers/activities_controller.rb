class ActivitiesController < ApplicationController
  def index
    @activities = Activity.upcoming
    if params[:search].present? && params[:search][:query] != ''
      @activities = Activity.upcoming.global_search(params[:search][:query])
    end
  end

  def show
    # @activity = Activity.find_by(id: params[:id])
    @activity = Activity.find(params[:id])
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
end

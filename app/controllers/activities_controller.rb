class ActivitiesController < ApplicationController
  def index
    @activities = Activity.upcoming
    if params[:search].present? && params[:search][:query] != ''
      @activities = Activity.upcoming.global_search(params[:search][:query])
    end
  end
end

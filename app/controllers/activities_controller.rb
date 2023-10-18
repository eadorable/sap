class ActivitiesController < ApplicationController
  def index
    @activities = Activity.all
    if params[:search].present? && params[:search][:query] != ''
      @activities = Activity.all.global_search(params[:search][:query])
    end
  end
end

class ActivitiesController < ApplicationController
  before_action :set_activity, only: %i[show edit update]

  def index
  end

  def show
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  private

  def set_activity
    @activity = Activity.find(params[:id])
  end
end
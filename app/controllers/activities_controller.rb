class ActivitiesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]
  before_action :set_activity, only: %i[show edit update destroy]

  def index
    category = params[:category]
    if category.present?
      @activities = Activity.where(category: category)
    else
      @activities = Activity.all
    end
    activities_lat_lng(@activities)
  end

  def show
    @order = Order.new
    activities_lat_lng(@activity)
  end

  def new
    @activity = Activity.new
    @user = current_user
  end

  def create
    @activity = Activity.new(activity_params)
    @activity.user = current_user
    if @activity.save
      redirect_to activity_path(@activity)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @activity.update(activity_params)
    if @activity.save
      redirect_to activity_path(@activity)
    else
      render :edit
    end
  end

  def destroy
    @activity.destroy
    redirect_to activities_path
  end

  private

  def set_activity
    @activity = Activity.find(params[:id])
  end

  def activity_params
    params.require(:activity).permit(:title, :description, :category, :duration, :min_age, :price, :photo)
  end

  def activities_lat_lng(activities)
    activities = [activities] if activities.is_a?(Activity)
    @map_markers = activities.geocoded.map { |activity| { lat: activity.latitude, lng: activity.longitude } }
  end
end

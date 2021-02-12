class ActivitiesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]
  before_action :set_activity, only: %i[show edit update destroy]

  def index
    min_age = params[:min_age]
    category = params[:category]
    if category.present?
      @activities = Activity.where(category: category)
    elsif min_age.present?
      @activities = Activity.where(min_age: min_age)
    else
      @activities = Activity.all
      @map_markers = @activities.geocoded.map { |activity| { lat: activity.latitude, lng: activity.longitude } }
    end
  end

  def show
    @order = Order.new
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
    if current_user == @activity.user
      @activity.destroy
      redirect_to user_profile_path
    else
      redirect_to root_path, alert: "You are not allowed to delete this activity"
    end
  end

  private

  def set_activity
    @activity = Activity.find(params[:id])
  end

  def activity_params
    params.require(:activity).permit(:title, :description, :category, :duration, :min_age, :price, :photo)
  end
end

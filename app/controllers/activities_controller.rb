class ActivitiesController < ApplicationController
  before_action :set_activity, only: %i[show edit update destroy]

  def index
    category = params[:category]
    if category.present?
      @activities = Activity.where(category: category)
    else
      @activities = Activity.all
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
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    @activity.update(activity_params)
    if @activity.save
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    if current_user == activity.user
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

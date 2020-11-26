class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @user = current_user
  end

  def user_profile
    @user = current_user
    @user_orders = @user.orders
  end

  def user_activities
    @user = current_user
    @user_activities = @user.activities
  end
end

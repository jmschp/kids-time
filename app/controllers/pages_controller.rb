class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
  end

  def user_profile
    @user = current_user
    @user_activities = @user.activities
  end

  def user_orders
    @user = current_user
    @user_orders = @user.orders
  end
end

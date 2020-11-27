class OrdersController < ApplicationController

  def create
    @user = current_user
    @order = Order.new
    @order.user = @user
    @order.activity = Activity.find(params[:activity_id])
    if @order.save
      redirect_to orders_approved_path
    else
      redirect_to activity_path(@order.activity)
    end
  end

  def approved
    @user = current_user
  end

  def user_orders
    @user = current_user
    @user_orders = @user.orders
  end

  def user_sales
    @orders = Order.all
    @user = current_user
    @user_activities = Activity.where(user_id: @user.id)

    @user_sales = @orders.select do |order|
      @user_activities.each do |activity|
        order.activity_id == activity.id
      end
    end
  end
end

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
end

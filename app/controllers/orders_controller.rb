class OrdersController < ApplicationController
  def create
    @order = Order.new
    @order.user = current_user
    @order.activity = Activity.find(params[:activity_id])
    if @order.save
      redirect_to orders_approved_path
    else
      redirect_to activity_path(@order.activity)
    end
  end

  def approved
  end
end

class OrdersController < ApplicationController
  def create
    @order = Order.new
    @order.user = current_user
    @order.activity = Activity.find(params[:activity_id])
    raise
    if order.save
      redirect_to activities_path
    else
      redirect_to activity_path(@order.activity)
    end
  end
end

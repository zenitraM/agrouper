class OrderController < ApplicationController
  def new
  	offer_id = params[:id]
  	offer = Offer.find(offer_id)

  	order = offer.orders.new
  	order.save
  	redirect_to :action => :control, :id => order.id
  end

  def join
  	order_id = params[:id]
  	@order = Order.find(order_id)

  end

  def control
  	order_id = params[:id]
  	@order = Order.find(order_id)
  	
  end

  def choose
  end

end

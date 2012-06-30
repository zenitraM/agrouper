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
	order_id = params[:id]
	@order = Order.find(order_id)
  end

  def add
	order_id = params[:id]
	user_id = session[:user_id]
	product_id = params[:product_id]
	quantity = params[:quantity]

	order = Order.find(order_id)
	user = order.users.find(user_id)
	product = order.offer.product.find(product_id)
	item = user.item.new
	item.product = product
	item.quantity = quantity
	item.save
  end

end

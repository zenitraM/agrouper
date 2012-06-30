class OrderController < ApplicationController
  def new
  	offer_id = params[:id]
  	offer = Offer.find(offer_id)

  	order = offer.orders.new
  	order.save
  	redirect_to :action => :control, :id => order.object_id
  end

  def join
  	order_id = params[:id]
  	@order = Order.find(order_id)
  	if params[:user]
  		user = @order.users.where({:username => params[:user][:username]}).first
  		if user == nil
			user = @order.users.new
  			user.username = params[:user][:username]
  		end
  		user.save
  		session[:user_id] = user.id
  		redirect_to :action => :choose, :id => @order.id
  	else
  		order_id = params[:id]
  		@order = Order.find(order_id)
  	end
  end

  def control
  	order_id = params[:id]
  	@order = Order.find(order_id)
  	
  end

  def choose
	order_id = params[:id]
	@order = Order.find(order_id)
	@user = User.find(session[:user_id])

  end

  def add
	order_id = params[:id]
	user_id = session[:user_id]
	product_id = params[:product_id]
	quantity = params[:quantity]

	order = Order.find(order_id)
	user = order.users.find(user_id)

	product = order.offer.products.find(product_id)

	item = user.items.where(:product_id => product_id).first
	if item == nil
		item = user.items.new
		item.quantity = 1
		item.product = product
	else
		item.quantity += quantity.to_i
	end
	item.save
	item.product.save

  	redirect_to :action => :choose, :id => order.id
  end

end

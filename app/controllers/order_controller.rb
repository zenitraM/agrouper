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

  end

end

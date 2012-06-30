class Order
  include Mongoid::Document
  field :qrcode, type: String
  

  belongs_to :offer
  has_many :users


  def get_total
  	self.users.to_a.sum {|u| u.get_total }
  end

  def get_persons_with_order
  	self.users.to_a.sum do |u| 
  		if u.get_count > 0
  			1
  		else
  			0
  	 	end 
  	end
  end

  def calculate_order_discount
  	discounts = self.offer.get_discounts
  	people_count = get_persons_with_order
  	puts "----------------------------"
  	order_total = get_total

  	discount = 0

  	discounts.each do |disc|
  		if disc[:users_required] <= people_count && disc[:lower_limit] <= order_total
  			discount = disc[:percentage]
  		end
  	end
  	discount
  end
end

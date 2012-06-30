class Item
  include Mongoid::Document
  has_one :product

  field :quantity, type: Integer

  belongs_to :user
  def get_total
  	self.product.price * self.quantity
  end

end
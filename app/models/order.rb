class Order
  include Mongoid::Document
  field :qrcode, type: String
  

  belongs_to :offer
  has_many :users


  def get_total
  	self.users.to_a.sum {|u| u.get_total }
  end
end

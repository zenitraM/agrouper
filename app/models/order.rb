class Order
  include Mongoid::Document
  field :qrcode, type: String
  

  belongs_to :offer
  has_many :users
end

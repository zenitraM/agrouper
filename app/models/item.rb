class Item
  include Mongoid::Document
  has_one :product
  field :quantity, type: String

end

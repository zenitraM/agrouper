class Product
  include Mongoid::Document
  belongs_to :offer
  field :title, type: String
  field :description, type: String
  field :price, type: Float
  has_many :items
end

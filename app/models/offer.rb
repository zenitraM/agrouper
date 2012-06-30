class Offer
  include Mongoid::Document
  field :title, type: String
  field :text, type: String
  field :description, type: String

  has_many :products
  has_many :orders
end
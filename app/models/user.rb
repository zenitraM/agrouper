class User
  include Mongoid::Document

  belongs_to :order
  has_many :items

  field :username
 
 end

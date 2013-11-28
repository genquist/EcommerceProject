class Lineitem < ActiveRecord::Base
  attr_accessible :price, :quantity
  validates :price, :quantity presence => true
  belongs_to :order
  belongs_to :product
  
end

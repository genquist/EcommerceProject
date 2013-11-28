class Lineitem < ActiveRecord::Base
  attr_accessible :price, :quantity
  validates :price, :quantity presence => true
end

class Lineitem < ActiveRecord::Base
  attr_accessible :price, :quantity
  validates :price, :quantity presence => true
  has_many :products
  belongs_to :order
end

class Product < ActiveRecord::Base
  attr_accessible :description, :name, :price, :stock_quantity
  validates :description, :name, :price, :stock_quantity presence => true
  has_many :lineitems
  has_many :orders, through: :lineitems
end

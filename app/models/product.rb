class Product < ActiveRecord::Base
  attr_accessible :description, :name, :price, :stock_quantity
  validates :description, :name, :price, :stock_quantity presence => true
  belongs_to :order
end

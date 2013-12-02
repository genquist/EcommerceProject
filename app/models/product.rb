class Product < ActiveRecord::Base
  attr_accessible :description, :name, :price, :stock_quantity, :image_filename, :catagory_id
  validates :description, :name, :price, :stock_quantity, presence: true
  has_many :lineitems
  has_many :orders, through: :lineitems
  belongs_to :catagory
end

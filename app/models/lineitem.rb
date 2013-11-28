class Lineitem < ActiveRecord::Base
  attr_accessible :price, :quantity, :product_id, :order_id
  validates :price, :quantity, :product_id, :order_id, presence: true
  belongs_to :order
  belongs_to :product
end

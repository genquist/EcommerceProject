class Order < ActiveRecord::Base
  attr_accessible :gst_rate, :hst_rate, :pst_rate, :status, :customer_id
  validates :status, :customer_id, presence: true
  belongs_to :customer
  has_many :lineitems
  has_many :products, through: :lineitems
end

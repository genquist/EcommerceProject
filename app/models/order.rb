class Order < ActiveRecord::Base
  attr_accessible :gst_rate, :hst_rate, :pst_rate, :status
  validates :status presence => true
end

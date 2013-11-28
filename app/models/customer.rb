class Customer < ActiveRecord::Base
  attr_accessible :address, :city, :country, :email, :first_name, :last_name, :postal_code
  validates :address, :city, :country, :email, :first_name, :last_name, :postal_code presence => true
  belongs_to :province
  has_many :orders
end

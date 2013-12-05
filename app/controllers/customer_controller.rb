class CustomerController < ApplicationController

	def create_order
    newcust = Customer.new
    newcust.first_name = params[:first_name]
    newcust.last_name = params[:last_name]
    newcust.address = params[:address]
    newcust.city = params[:city]
    newcust.postal_code = params[:postal_code]
    newcust.email = params[:email]
    newcust.province_id = params[:province]
    newcust.save

	redirect_to :action => :index
  end
end

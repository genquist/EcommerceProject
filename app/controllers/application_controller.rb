class ApplicationController < ActionController::Base
  protect_from_forgery

  protected
	def initialize_cart
		session[:cart] ||= []
    @total = 0
		@cart = []
		session[:cart].each {|id| @cart << Product.find(id)}

    @cart.each do |item|
      @total += item.price
    end
	end
end

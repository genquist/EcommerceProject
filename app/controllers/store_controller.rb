class StoreController < ApplicationController
	before_filter :initialize_cart

  def index
  	@products = Product.order(:name).page(params[:page]).per(5)
  end

  def show
  	@product = Product.find(params[:id])
  end

  def search_results
  	@products = Product.where("name LIKE ?", "%#{params[:keywords]}%")
  end

  def shopping_cart
    @disable_cart = true
  end

  def add_product
  	id = params[:id].to_i
  	session[:cart] ||= []
  	session[:cart] << id 
  	redirect_to :action => :index
  end

  def remove_product
  	id = params[:id].to_i
  	session[:cart].delete(id)
  	redirect_to :action => :index
  end

  def clear_cart
  	session[:cart] = nil
  	redirect_to :action => :index
  end

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

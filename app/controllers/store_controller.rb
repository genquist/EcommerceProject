class StoreController < ApplicationController
	before_filter :initialize_cart

  def index
  	@products = Product.order(:name).page(params[:page]).per(3)
  end

  def show
  	@product = Product.find(params[:id])
  end

  def search_results
  	@products = Product.where("name LIKE ?", "%#{params[:keywords]}%")
  end

  def add_product
  	id = params[:id].to_i
  	session[:cart] ||= []
  	session[:cart] << id unless session[:cart].include?(id)
  	redirect_to :action => :index
  end

  def remove_product
  	id = params[:id].to_i
  	session[:cart].delete(id)
  	redirect_to :action => :index
  end

  def clear_products
  	session[:cart] = nil
  	redirect_to :action => :indexs
  end

protected
	def initialize_cart
		session[:cart] ||= []
		@cart = []
		session[:cart].each {|id| @cart << Product.find(id)}
	end

end

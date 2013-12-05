class StoreController < ApplicationController
	before_filter :initialize_cart

  def index
  	@products = Product.order(:name).page(params[:page]).per(5)
  end

  def show
  	@product = Product.find(params[:id])
  end

  def search_results
  	@products = Product.joins(:catagory).where("products.name LIKE ? or catagories.name LIKE ?", "%#{params[:keywords]}%", "%#{params[:keywords]}%")
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

  def order
    @disable_cart = true
    @province = Province.all
  end

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

    redirect_to :action => :order
    #redirect_to :action => :index
  end
end

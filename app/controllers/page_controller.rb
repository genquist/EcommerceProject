class PageController < ApplicationController
	before_filter :initialize_cart
	
	def about
		@page = Page.first
	end

	def contact_us
		@page = Page.last
	end
end

class PageController < ApplicationController
	def about
		@page = Pages.first
	end

	def contact_us
		@page = Pages.last
	end
end

class BrowseController < ApplicationController
	def index
		@paints = Paint.all.order("created_at")
	end
end

class FeedsController < ApplicationController

	def index
		@feeds = @posts.each
	end
	


end

class BusinessesController < ApplicationController
	def show
		puts params
		puts "*" * 100
		@business = Business.find(params[:id])
		# @hero_level_1 = business.find(params[:id]).where(:business_points.gt => 500).to_a
		# @hero_level_2 = business.find(params[:id]).where(:business_points.gt => 1000).to_a
		# @hero_level_3 = business.find(params[:id]).where(:business_points.gt => 2000).to_a
		# @hero_level_4 = business.find(params[:id]).where(:business_points.gt => 4000).to_a
		# @hero_level_5 = business.find(params[:id]).where(:business_points.gt => 8000).to_a
	end
	
	def new
		@business = Business.new
	end

	def create
		@business = Business.create(params[:business].permit(:business_name, :industry, :email, :password, :password_confirmation, :business_points_posted, :business_points_earned))
		redirect_to root_url
	end


end

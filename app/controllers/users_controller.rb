class UsersController < ApplicationController
	def show
		puts params
		puts "*" * 100
		@user = User.find(params[:id])
		# @hero_level_1 = User.find(params[:id]).where(:user_points.gt => 500).to_a
		# @hero_level_2 = User.find(params[:id]).where(:user_points.gt => 1000).to_a
		# @hero_level_3 = User.find(params[:id]).where(:user_points.gt => 2000).to_a
		# @hero_level_4 = User.find(params[:id]).where(:user_points.gt => 4000).to_a
		# @hero_level_5 = User.find(params[:id]).where(:user_points.gt => 8000).to_a
	end
	
	def new
		@user = User.new
	end

	def create
		@user = User.create(params[:user].permit(:first_name, :last_name, :email, :password, :password_confirmation, :user_points_posted))
		redirect_to root_url
	end
	
	# def addPoints
	# 	@user = User.find(params[:id])
	# 	userPoints = @user.user_points + post.points 
	# 	user.save(point: userPoints)
	# end

	





end

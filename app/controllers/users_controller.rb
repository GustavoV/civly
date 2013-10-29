class UsersController < ApplicationController
	def show
		puts params
		puts "*" * 100
		@user = User.find(params[:id])
	end
	
	def new
		@user = User.new
	end

	def create
		@user = User.create(params[:user].permit(:first_name, :last_name, :email, :password, :password_confirmation))
		redirect_to root_url
	end
	
	# def addPoints
	# 	@user = User.find(params[:id])
	# 	userPoints = @user.user_points + post.points 
	# 	user.save(point: userPoints)
	# end





end

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
	
	def show_all
		@user = User.all
	end

	def new
		@user = User.new
	end

	def create
		@user = User.create(params[:user].permit(:first_name, :last_name, :email, :password, :password_confirmation, :user_points_posted, :user_points_earned, :photo))
		redirect_to root_url
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])

		if @user.update_attributes(params[:user].permit(:first_name, :last_name, :email, :password, :password_confirmation, :user_points_posted, :user_points_earned, :photo))
			redirect_to action: 'show', id: @user
		else
			render 'edit'
		end
	end

	def index
	end

	
end

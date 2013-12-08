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
	end

	def create
		user = User.create(user_params)
		if user
			session[:user_id] = user.id
			if user[:role] == :hero
			  redirect_to all_posts_path
			elsif user[:role] == :patron || user[:role] == :group
			  redirect_to user_path
			else
			  redirect_to all_posts_path
			end
		else
			flash.now.alert = "Unable to sign you up. Please try again."
			render :new
		end
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

	private

	def user_params
		 params.require(:user).permit(:first_name, :last_name, :role, :email, :password, :password_confirmation, :user_points_posted, :user_points_earned, :photo)
	end


end

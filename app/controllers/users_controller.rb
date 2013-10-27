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
		redirect_to user_path(@user)
	end
	


end

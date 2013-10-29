class PostsController < ApplicationController

	def new
		@user = User.find(params[:user_id])
		# @post = Post.new()
	end

	def show
		@post = Post.find(params[:id])
	end
	
	def index
	end

	def create
		puts "* " * 100
		puts params
	 	@user = User.find(params[:user_id])
	 	p = @user.posts.create(params[:post].permit(:post_title, :description, :points, :lat, :lon))

		@user.user_points += p.points.to_i

		@user.save

		redirect_to user_path(@user)
	end


	def show_all
		@posts = Post.all
	end

	def change_status
		puts 'hooter g' * 100

		puts params

		@post = Post.find(params[:id])
		@post.update_attributes( :status => 'Hero In Action!')

		redirect_to :back

	end





end
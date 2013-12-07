class PostsController < ApplicationController

	def new

		@user = User.find(params[:user_id])
	
	end

	def show
		@post = Post.find(params[:id])
		
	end
	
	def index
	end

	def create
		
	 	@user = User.find(params[:user_id])
	 	p = @user.posts.create(params[:post].permit(:post_title, :description, :points, :lat, :lon))

		@user.user_points_posted += p.points.to_i

		@user.save

		redirect_to user_path(@user)
	end


	def show_all
		@posts = Post.all
		puts "$" * 100
		puts params 
	end

	def change_status

		@post = Post.find(params[:id])
		@user = current_user
		@post.update_attributes( :status => 'Hero In Action!')


		 # @code = ""
		 #    r = rand(1544804416/34/34/34)
		 #    3.times do
		 #      @code += "0123456789ABCDEFGHJKLMNPQRSTUVWXYZ"[r%34]
		 #      r = r/34
		 #    end

		@user.user_points_earned += @post.points.to_i

		@user.save

		redirect_to :back

	end


	def edit
		@user = User.find(params[:user_id])
		@post = @user.posts.find(params[:id])
	end

	def update
		@user = User.find(params[:user_id])
		@post = @user.posts.find(params[:id])

		if @post.update_attributes(params[:post].permit(:post_title, :description))
			redirect_to action: 'show', id: @post
		else
			render 'edit'
		end
	end

	def destroy
		Post.find(params[:id]).destroy
		user_path(@user)
		redirect_to action: 'show_all'
	end




end
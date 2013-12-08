class AuthenticationsController < ApplicationController
  before_action :authenticate_user, only: [:destroy]

  def new
    # Are they already logged in?
    if current_user # They are!  Can't create them again.
      redirect_to authentications_url
    else
      @user = User.new

    end
  end

  def create
    user = User.find_by(email: params[:user][:email])
    if user
        # authenticate user
        if user.authenticate(params[:user][:password])
          session[:user_id] = user.id
          if user[:role] == :hero
            redirect_to all_posts_path
          elsif user[:role] == :patron || user[:role] == :group
            redirect_to user_path
          else
            redirect_to all_posts_path
          end
        else
          flash.now.alert = "Unable to sign you in. Please try again."
          render :new
        end
    end
  end

  def show
  end


  def destroy
    session[:user_id] = nil
    redirect_to root_url,
     notice: "You signed out."
  end


end

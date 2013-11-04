class BusinessAuthenticationsController < ApplicationController
  before_action :authenticate_business, only: [:destroy]

  def new
    # Are they already logged in?
    if current_business # They are!  Can't create them again.
      redirect_to authentications_url
    else
      @business = Business.new

    end
  end

  def create
    business = Business.find_by(email: params[:business][:email])
    if business
        # authenticate business
        if business.authenticate(params[:business][:password])
          session[:business_id] = business.id
          redirect_to business_path(business)
        else
          flash.now.alert = "Unable to sign you in. Please try again."
          @business = Business.new
          render :new
        end
    end
  end

  def show
    @business = Business.find(params[:id])
  end


  def destroy
    session[:business_id] = nil
    redirect_to root_url,
     notice: "You signed out."
  end


  
end

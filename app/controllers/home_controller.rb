#require 'digest/sha2'

class HomeController < ApplicationController


  def login
    if current_user
      redirect_to :action => 'index'
    end
  end

  def logout
    reset_session
    flash[:notice] = "Successfully logged out"
    redirect_to root_url
  end

  def create_session
   if !authenticate(params[:email], params[:password]).nil?
      session[:current_user_id] = authenticate(params[:email], params[:password]).id
   flash[:notice] = "Successfully logged in"
   redirect_to :action => 'index'
  else
    flash[:warning] = "There was a problem with your login details.  Please try again."
    redirect_to :action => "login"
  end
  end

end
class ApplicationController < ActionController::Base
 # provides debugging info for current user
  before_filter :current_user
  # REMOVE this before_filter for production

  protect_from_forgery

    # As is the 'standard' with rails apps we'll return the user record if the
    # password is correct and nil if it isn't.
    def authenticate(email, password)
      # Because we salt the passwords we can't do this query in one part, first
      # we need to fetch the potential user
      if user = User.find_by_email(email)
        # Then compare the provided password against the hashed one in the db.
        if user.hashed_password == Digest::SHA2.hexdigest(user.salt + password)
          # If they match we return the user
          return user
        end
      end
      # If we get here it means either there's no user with that email, or the wrong
      # password was provided.  But we don't want to let an attacker know which.
      return nil
    end

  def current_user
    @current_user ||= session[:current_user_id] && User.find(session[:current_user_id])
  end

  def is_admin?
    # admin is user role level 1
    # normal users are role level 2 and up
    if current_user
      unless current_user.role.nil?
        if current_user.role < 2
          return true
        end
      end
    end
    return false
  end

  # use this method in before filters to restrict controllers and actions
  # from being accessed by common (non-admin) users
  def admin_only
    unless is_admin?
      flash[:warning] = "You are not authorized to perform that action or view that page!"
      if request.env['HTTP_REFERER'].nil?
        redirect_to root_url
      else
        redirect_to :back
      end
    end
  end

  # use this method to in before filters to restrict controllers and actions
  # from being accessed by non-logged in users (guests)
  def require_login
    unless current_user
      flash[:warning] = "You must be logged in to view that page!"
      redirect_to :controller => "home", :action => "login"
    end
  end

  def require_logout
    if current_user
      redirect_to :controller => 'home', :action => 'logout'
    end
  end

end
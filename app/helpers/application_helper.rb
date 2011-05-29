module ApplicationHelper

  # Return a title on a per-page basis.
  def title
    base_title = "MedHub"
    if @title.nil?
      base_title
    else
      "#{base_title} | #{@title}"
    end
  end

  def is_admin?
    # admin is user role level 1
    # normal users are role level 2 and up
    unless @current_user.role.nil?
      unless @current_user.role >1
        return true
      end
    end
    return false
  end

  def current_user
    @current_user ||= session[:current_user_id] && User.find(session[:current_user_id])
  end


end
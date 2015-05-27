class ApplicationController < ActionController::Base
  before_filter :authorize
  protect_from_forgery
  
  protected
  
  def authorize
    unless User.find_by_id(session[:user_id])
      redirect_to login_url, :notice => "Please log in!"
    end
  end

  def must_be_Superadmin_or_Departmenthead_or_Sectionhead
    unless session[:user_role] == "Superadmin" || session[:user_role] == "Departmenthead" || session[:user_role] == "Sectionhead"
      redirect_to admin_url, :notice => "You do not have access permission!"
    end
  end
end

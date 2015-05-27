class SessionsController < ApplicationController
  skip_before_filter :authorize
  def new
  end

  def create
    if user = User.authenticate(params[:name], params[:password])
  	  session[:user_id] = user.id
  	  session[:user_name] = user.name
      session[:user_fullname] = user.fullname
  	  session[:user_role] = user.role
      session[:user_section] = user.section 
  	  redirect_to admin_url
  	else
  	  redirect_to login_url, :alert => "Invalid user/password combination"
  	end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

  def change_details
    user_id = session[:user_id]
    @user = User.find_by_id(user_id)
  end
  
  def update_details
    user_id = session[:user_id]
    @user = User.find_by_id(user_id)
      respond_to do |format|
      # if @user.update_attributes(params[:user])
      if @user.update_attributes(params[:user].permit(:name, :fullname, :role, :section, :email, :phone, :location, :password, :password_confirmation))
        format.html { redirect_to(:show_details, :notice => "User #{@user.name} was successfully updated.") }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def show_details
    user_id = session[:user_id]
    @user = User.find_by_id(user_id)
  end
end

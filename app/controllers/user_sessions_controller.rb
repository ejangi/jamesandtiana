class UserSessionsController < ApplicationController
  before_filter :require_no_user, :only => [:new, :create]
  before_filter :require_user, :only => :destroy
  
  def new
    @user_session = UserSession.new
  end
  
  def create
    @user_session = UserSession.new(params[:user_session])
    @user_session.remember_me = true
    if @user_session.save
      redirect_to logged_in_url
    else
      render :action => :new
    end
  end
  
  def destroy
    current_user_session.destroy
    flash[:notice] = "Logout successful!"
    redirect_to root_url
  end
  
  def quicklogin
    key = params[:key]
    
    if key.nil?
      redirect_to root_url 
      return
    end
    
    begin
      user = User.find_by_key(key)
    rescue Exception => e
      redirect_to root_url
      return
    end
    
    @user_session = UserSession.new(user, true)
    if @user_session.save
      redirect_to logged_in_url
    else
      render :action => :new
    end
  end
end
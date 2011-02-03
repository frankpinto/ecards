class AuthController < ApplicationController
  before_filter :check_login, :except => 'logout'

  def check_login
    if logged_in?
      redirect_to :controller => 'home', :action => 'list'
    end
  end

  def login
    if params['code']
      user_token params['code']
      logged_in true
      redirect_to :controller => 'home', :action => 'list'
    else
      logged_in false
      redirect_to :action => 'index'
    end
  end

  def logout
    reset_token
    logged_in false
    redirect_to :action => 'index'
  end

  def index
    if (@logged_in = logged_in?) && user_token?
      @access_token = user_token
      redirect_to :controller => 'home'
    else
      @access_token = token
    end
  end
end

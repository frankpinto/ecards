class AuthController < ApplicationController
  before_filter :check_login

  def check_login
    if logged_in?
      redirect_to :controller => 'home'
    end
  end

  def login
    if params['code']
      graph = Koala::Facebook::GraphAPI.new(params['code'])
      logged_in true
      redirect_to :controller => 'home', :action => 'list', :graph => graph
    else
      logged_in false
      redirect_to :action => 'index'
    end
  end

  def logout
    reset_token
    logged_in false
    redirect_to 'index'
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

require 'lib/Authentication'

class AuthController < ApplicationController
  include ::Authentication
  before_filter :check_login, :only => 'list'

  def check_login
    if !logged_in?
      redirect_to 'index'
    end
  end

  def login
    if params['access_token']
      graph = Koala::Facebook::GraphAPI.new(params['access_token'])
      logged_in true
      redirect_to :controller => 'home', :action => 'list', :graph => graph
    else
      logged_in false
      redirect_to 'index'
    end
  end

  def logout
    @access_token = Facebook::APP_ID.to_s
    logged_in false
    redirect_to 'index'
  end

  def index
    if (@logged_in = logged_in?) && user_token?
      @access_token = user_token
    else
      @access_token = reset_token
    end
  end
end

class AuthController < ApplicationController
  before_filter :check_login, :except => 'logout'
  skip_before_filter :ensure_login

  def check_login
    if logged_in?
      redirect_to :controller => 'home', :action => 'list'
    end
  end

  def login
    if params['code']
      @oauth = Koala::Facebook::OAuth.new URI.escape(url_for(:action => 'login_extended', :path_only => false))
      #url = @oauth.url_for_access_token params['code'], :callback => url_for(:action => 'login_extended')
      result_hash = @oauth.get_access_token_info params['code'] #@oauth.parse_token_string(@oauth.fetch_token_string :code => params['code'])
      user_token = result_hash['access_token']
      expires_at = result_hash['expires'] + Time.now
      logged_in = true
      redirect_to :controller => 'home', :action => 'list'
    else
      logged_in = false
      redirect_to :action => 'index'
    end
  end

  def login_extended
    user_token = params['access_token']
    expires_at = params['expires'] + Time.now
    logged_in = true
    redirect_to :controller => 'home', :action => 'list'
  end

  def logout
    reset_token
    logged_in = false
    redirect_to :action => 'index'
  end

  def index
    if (@logged_in = logged_in?) && user_token?
      @access_token = user_token
      redirect_to :controller => 'home', :action => 'list'
    else
      @oauth = Koala::Facebook::OAuth.new
      @access_token = token
    end
  end
end

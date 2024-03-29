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
      @oauth = Koala::Facebook::OAuth.new 'http://tangibleecards.com/auth/login'
      #url = @oauth.url_for_access_token params['code'], :callback => url_for(:action => 'login_extended')
      result_hash = @oauth.get_access_token_info params['code'] #@oauth.parse_token_string(@oauth.fetch_token_string :code => params['code'])
      self.user_token = result_hash['access_token']
      self.expires_at = Time.now + result_hash['expires'].to_i
      self.logged_in = true
      redirect_to :controller => 'home', :action => 'list'
    else
      self.logged_in = false
      redirect_to :action => 'index'
    end
  end

  def logout
    reset_token
    self.logged_in = false
    redirect_to :action => 'index'
  end

  def index
    if (@logged_in = logged_in?) && user_token?
      @access_token = self.user_token
      redirect_to :controller => 'home', :action => 'list'
    else
      @oauth = Koala::Facebook::OAuth.new
      @access_token = self.token
    end
  end
end

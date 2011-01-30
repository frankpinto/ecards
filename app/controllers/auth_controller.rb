class AuthController < ApplicationController
  def login
    session['fbook'] = params['access_token']
    session['logged_in'] = true
  end

  def logout
  end

  def index
    @access_token = session['fbook'] || 192551997440118
    @logged_in = session['logged_in'] || false;
  end

end

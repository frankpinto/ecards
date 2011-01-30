class AuthController < ApplicationController
  def login
    session['fbook'] = params['access_token']
    session['logged_in'] = true
  end

  def logout
    session['logged_in'] = false
  end

  def index
    if session['logged_in']
      @access_token = session['fbook']
      @logged_in = session['logged_in']
    else
      @access_token = 192551997440118
      @logged_in = false;
    end
  end

end

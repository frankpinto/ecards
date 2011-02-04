require 'lib/Authentication'

# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  #protect_from_forgery # See ActionController::RequestForgeryProtection for details
  include ::Authentication  

  def ensure_login
    if self.expires_at < Time.now
      self.logged_in = false
      reset_token
    end
    if !logged_in?
      redirect_to :controller => 'auth'
    end    
  end

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
end

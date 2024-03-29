module Authentication
    def logged_in?
      session[:logged_in] || false
    end

    def logged_in= t_value
      session[:logged_in] = t_value
    end
  
    def user_token?
      session[:access_token] != Facebook::APP_ID.to_s 
    end

    def user_token
      user_token? ? session[:access_token] : token
    end

    def user_token= token
      session[:access_token] = token
    end

    def reset_token 
      session.delete :expires_at
      session[:access_token] = Facebook::APP_ID.to_s 
    end

    def token 
      session[:access_token] || reset_token
    end

    def expires_at
      Time.parse(session[:expires_at] || Time.now - 10)
    end

    def expires_at= time
      session[:expires_at] = time.to_s
    end
end

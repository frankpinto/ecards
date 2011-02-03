module Authentication
    def logged_in?
      session['logged_in'] || false
    end

    def logged_in t_value
      session['logged_in'] = t_value
    end
  
    def user_token?
      session[:access_token] != Facebook::APP_ID.to_s 
    end

    def user_token= token
      session[:access_token] = token
    end

    def reset_token 
      session[:access_token] = Facebook::APP_ID.to_s 
    end
end

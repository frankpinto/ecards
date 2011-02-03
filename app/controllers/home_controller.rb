class HomeController < ApplicationController
  def list
    if params[:code]
      session[:access_token] = Koala::Facebook::OAuth.new(oauth_redirect_url).get_access_token(params[:code])
      @graph = params['graph']
      @friends = @graph.get_connections('me', 'likes')
    end
  end
end

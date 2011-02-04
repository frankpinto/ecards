class HomeController < ApplicationController
  def list
    if user_token?
      @graph = Koala::Facebook::GraphAPI.new user_token
      @friends = @graph.get_connections('me', 'likes')
    else
      @friends = ["#{token}"]
    end
  end
end

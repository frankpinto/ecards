class HomeController < ApplicationController
  def list
    if user_token?
      @graph = Koala::Facebook::GraphAPI.new self.user_token
      @friends = @graph.get_connections('me', 'friends', :q => 'Alden')
      render :text => @friends.inspect
    else
      @friends = ["#{self.token}"]
    end
  end
end

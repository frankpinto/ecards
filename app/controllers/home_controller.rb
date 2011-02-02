class HomeController < ApplicationController
  def list
    @friends = @graph.get_connections('me', 'likes')
  end
end

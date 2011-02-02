class HomeController < ApplicationController
  def list
    @graph = params['graph']
    @friends = @graph.get_connections('me', 'likes')
  end
end

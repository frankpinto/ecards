class HomeController < ApplicationController
  def list
    if params[:graph]
      @graph = params['graph']
      @friends = @graph.get_connections('me', 'likes')
    else
      @friends = ['Didn\'t work!']
    end
  end
end

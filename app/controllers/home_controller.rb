class HomeController < ApplicationController
  def list
    if user_token?
      #@graph = Koala::Facebook::GraphAPI.new self.user_token
      @graph = Koala::Facebook::GraphAndRestAPI.new(self.user_token)
      @me = @graph.get_object('me', :fields => 'birthday, first_name, last_name')
      @friends = @graph.graph_call('me/friends', :fields => 'birthday, name')['data'].select {|friend| friend.has_key? 'birthday'}
    else
      @friends = ["#{self.token}"]
    end
  end
end

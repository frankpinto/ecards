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

  def fbevent
    if user_token?
      @graph = Koala::Facebook::GraphAPI.new(self.user_token)

      # First get people that are invited to the event and collect their name
      @friends = @graph.get_connections('199582233391970', 'invited')
      @names = @friends.collect {|friend| friend['name']}
      f = File.open 'names.txt', 'w'
      f.puts @names.join("\n")
      f.close

      # Then run them through the Columbia UNI Lookup and pull their emails
      #@names.each do |name|
      #end
    else
      render :text => 'login first'
    end
  end
  
end

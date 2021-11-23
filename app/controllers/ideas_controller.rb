class IdeasController < ApplicationController
  def twitter_client
    return client = Twitter::REST::Client.new do |config|
      config.consumer_key = ENV["TWITTER_CONSUMER_KEY"]
      config.consumer_secret = ENV["TWITTER_CONSUMER_SECRET"]
      config.access_token = ENV["TWITTER_ACCESS_TOKEN"]
      config.access_token_secret = ENV["TWITTER_ACCESS_TOKEN_SECRET"]
    end
  end

  def index
    client = twitter_client
    @tweets = client.home_timeline.first(2)
    #@trends = client.trends(id = 23424856).first(10)
  end

  def show

  end

end

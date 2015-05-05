require 'twitter'

module Engagement
  class CommentCounter
    class Twitter

      def initialize(credentials)
        @client = ::Twitter::REST::Client.new do |config|
          config.consumer_key = credentials[:consumer_key]
          config.consumer_secret = credentials[:consumer_secret]
          config.access_token = credentials[:oauth_token]
          config.access_token_secret = credentials[:oauth_token_secret]
        end
      end

      # FYI, Twitter only returns 6-9 days worth of tweet data
      def comments_count(url)
        results = @client.search(url)
        results.count
      end
    end
  end
end

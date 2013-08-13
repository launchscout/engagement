require 'twitter'

module Engagement
  class CommentCounter
    class Twitter

      def initialize(credentials)
        ::Twitter.configure do |config|
          config.consumer_key = credentials[:TWITTER_CONSUMER_KEY]
          config.consumer_secret = credentials[:TWITTER_CONSUMER_SECRET]
          config.oauth_token = credentials[:TWITTER_OAUTH_TOKEN]
          config.oauth_token_secret = credentials[:TWITTER_OAUTH_TOKEN_SECRET]
        end
      end

      # FYI, Twitter only returns 6-9 days worth of tweet data
      def comments_count(url)
        ::Twitter.search(url)[:statuses].count
      end
    end
  end
end

require 'twitter'

module Engagement
  class CommentCounter
    class Twitter

      def initialize(credentials)
        ::Twitter.configure do |config|
          config.consumer_key = credentials[:consumer_key]
          config.consumer_secret = credentials[:consumer_secret]
          config.oauth_token = credentials[:oauth_token]
          config.oauth_token_secret = credentials[:oauth_token_secret]
        end
      end

      # FYI, Twitter only returns 6-9 days worth of tweet data
      def comments_count(url)
        ::Twitter.search(url)[:statuses].count
      end
    end
  end
end

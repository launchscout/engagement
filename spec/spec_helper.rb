require 'engagement'
require 'debugger'
require 'vcr'

def disqus_forum_api_key
  ENV['DISQUS_FORUM_API_KEY']
end

def twitter_credentials
  {
    consumer_key: ENV['TWITTER_CONSUMER_KEY'],
    consumer_secret: ENV['TWITTER_CONSUMER_SECRET'],
    oauth_token: ENV['TWITTER_OAUTH_TOKEN'],
    oauth_token_secret: ENV['TWITTER_OAUTH_TOKEN_SECRET'],
  }
end

def twitter_credentials_present?
  twitter_credentials[:consumer_key] &&
  twitter_credentials[:consumer_secret] &&
  twitter_credentials[:oauth_token] &&
  twitter_credentials[:oauth_token_secret]
end

VCR.configure do |c|
  c.cassette_library_dir = 'spec/cassettes'
  c.hook_into :webmock
  c.configure_rspec_metadata!
  c.filter_sensitive_data('<FILTERED>') { disqus_forum_api_key }
  c.filter_sensitive_data('<TWITTER_CONSUMER_KEY>') { twitter_credentials[:consumer_key] }
  c.filter_sensitive_data('<TWITTER_OAUTH_TOKEN>') { twitter_credentials[:oauth_token] }
end


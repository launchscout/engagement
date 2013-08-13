require 'engagement'
require 'debugger'
require 'vcr'

def disqus_forum_api_key
  ENV['DISQUS_FORUM_API_KEY']
end

def twitter_credentials
  {
    TWITTER_CONSUMER_KEY: ENV['TWITTER_CONSUMER_KEY'],
    TWITTER_CONSUMER_SECRET: ENV['TWITTER_CONSUMER_SECRET'],
    TWITTER_OAUTH_TOKEN: ENV['TWITTER_OAUTH_TOKEN'],
    TWITTER_OAUTH_TOKEN_SECRET: ENV['TWITTER_OAUTH_TOKEN_SECRET'],
  }
end

def twitter_credentials_present?
  twitter_credentials[:TWITTER_CONSUMER_KEY] &&
  twitter_credentials[:TWITTER_CONSUMER_SECRET] &&
  twitter_credentials[:TWITTER_OAUTH_TOKEN] &&
  twitter_credentials[:TWITTER_OAUTH_TOKEN_SECRET]
end

VCR.configure do |c|
  c.cassette_library_dir = 'spec/cassettes'
  c.hook_into :webmock
  c.configure_rspec_metadata!
  c.filter_sensitive_data('<FILTERED>') { disqus_forum_api_key }
end

RSpec.configure do |c|
  # so we can use :vcr rather than :vcr => true;
  # in RSpec 3 this will no longer be necessary.
  c.treat_symbols_as_metadata_keys_with_true_values = true
end

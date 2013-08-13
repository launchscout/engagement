require 'spec_helper'

describe Engagement::CommentCounter::Twitter do

  if twitter_credentials_present?
    let(:counter) { Engagement::CommentCounter::Twitter.new(twitter_credentials) }
    let(:url) { 'http://gaslight.co/blog/angular-backed-svgs' }

    it 'returns the number of comments for the given url', :vcr do
      counter.comments_count(url).should == 15
    end
  else
    puts 'Skipping Twitter test, please set the TWITTER_CONSUMER_KEY,TWITTER_CONSUMER_SECRET,TWITTER_OAUTH_TOKEN,TWITTER_OAUTH_TOKEN_SECRET environment variables.'
  end
end

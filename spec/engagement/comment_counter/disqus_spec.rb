require 'spec_helper'

describe Engagement::CommentCounter::Disqus, :vcr do

  it 'returns the number of comments for the given url' do
    url = 'http://diminishing.org/searching-for-a-hero-ruby'
    counter = Engagement::CommentCounter::Disqus.new(disqus_forum_api_key)
    counter.comments_count(url).should == 4
  end

end

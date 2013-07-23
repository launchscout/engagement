require 'spec_helper'

describe Engagement::CommentCounter::Reddit, :vcr do

  it 'returns the number of comments for the given url' do
    url = 'http://i.imgur.com/VzFTsGg.png'
    counter = Engagement::CommentCounter::Reddit.new
    counter.comments_count(url).should == 528
  end

end

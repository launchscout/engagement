require 'spec_helper'

describe Engagement::CommentCounter::HackerNews, :vcr do

  it 'returns the number of comments for the given url' do
    url = 'http://www.90percentofeverything.com/2013/07/23/the-slippery-slope/'
    counter = Engagement::CommentCounter::HackerNews.new
    expect(counter.comments_count(url)).to eq(18)
  end

end

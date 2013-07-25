require 'spec_helper'

describe Engagement::CommentCounter::Disqus do

  if disqus_forum_api_key
    let(:counter) { Engagement::CommentCounter::Disqus.new(disqus_forum_api_key) }

    context "when we own the url", :vcr do
      let(:url) { 'http://diminishing.org/searching-for-a-hero-ruby' }

      it 'returns the number of comments for the given url' do
        counter.comments_count(url).should == 4
      end
    end

    context "when we don't own the url", :vcr do
      let(:url) { 'http://google.com' }

      it "returns zero when we don't own the url" do
        counter.comments_count(url).should == 0
      end
    end
  else
    puts 'Skipping Disqus test, please set the DISQUS_FORUM_API_KEY environment variable.'
  end

end

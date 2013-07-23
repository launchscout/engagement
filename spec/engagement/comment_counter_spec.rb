require 'spec_helper'

describe Engagement::CommentCounter do

  class TestCommentCounter
    def initialize
      @counts_by_url = Hash.new(0)
    end

    def add_count_for_url(url, count)
      @counts_by_url[url] = count
    end

    def comments_count(url)
      @counts_by_url[url]
    end
  end

  it 'aggregates the results from multiple counters' do
    url = 'http://google.com'

    counter_1 = TestCommentCounter.new
    counter_1.add_count_for_url(url, 2)

    counter_2 = TestCommentCounter.new
    counter_2.add_count_for_url(url, 1)

    counter = Engagement::CommentCounter.new([counter_1, counter_2])

    counter.comments_count(url).should == 3
  end

end

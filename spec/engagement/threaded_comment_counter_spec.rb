require 'spec_helper'
require 'benchmark'

describe Engagement::CommentCounter::Threaded do
  
  class TimedCounter
    def initialize(seconds, value)
      @seconds = seconds
      @value = value
    end

    def comments_count(url)
      sleep @seconds
      @value
    end
  end

  it 'fetches results concurrently' do
    timed_counter_1 = TimedCounter.new(0.3, 1)
    timed_counter_2 = TimedCounter.new(0.1, 2)
    counter = Engagement::CommentCounter::Threaded.new([timed_counter_1, timed_counter_2])

    time = Benchmark.realtime {
      expect(counter.comments_count('http://google.com')).to eq(3)
    }

    expect(time).to be_within(0.05).of(0.3)
  end

end

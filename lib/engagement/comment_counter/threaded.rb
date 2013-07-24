require 'thread'

class Engagement::CommentCounter::Threaded

  def initialize(places)
    @places = places
    @mutex = Mutex.new
  end

  def comments_count(url)
    comments_count = 0
    threads = []

    @places.each do |place|
      threads << Thread.new do
        count = place.comments_count(url)
        
        @mutex.synchronize do
          comments_count += count
        end
      end
    end

    threads.each(&:join)
    comments_count
  end

end
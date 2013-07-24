module Engagement
  class CommentCounter

    autoload :Threaded, 'engagement/comment_counter/threaded'
    autoload :HackerNews, 'engagement/comment_counter/hacker_news'
    autoload :Reddit, 'engagement/comment_counter/reddit'
    autoload :Disqus, 'engagement/comment_counter/disqus'

    def initialize(places)
      @places = places
    end

    def comments_count(url)
      @places.inject(0) do |comments_count, place|
        comments_count + place.comments_count(url)
      end
    end

  end
end

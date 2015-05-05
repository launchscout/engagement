module Engagement
  class CommentCounter

    autoload :Threaded, 'engagement/comment_counter/threaded'
    autoload :Reddit, 'engagement/comment_counter/reddit'
    autoload :Disqus, 'engagement/comment_counter/disqus'
    autoload :Twitter, 'engagement/comment_counter/twitter'

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

module Engagement
  class CommentCounter

    autoload :HackerNews, 'engagement/comment_counter/hacker_news'

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

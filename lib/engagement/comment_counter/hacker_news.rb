require 'hacker_news_search'

class Engagement::CommentCounter::HackerNews
  def initialize
    @client = HackerNewsSearch.new
  end

  def comments_count(url)
    @client.search("items", url)['results'].inject(0) { |comments_count, result|
      comments_count + result['item']['num_comments']
    }
  end
end

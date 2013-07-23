require 'snoo'

class Engagement::CommentCounter::Reddit
  def initialize
    @client = Snoo::Client.new
  end

  def comments_count(url)
    response = @client.search(url).parsed_response
    data = response['data']
    children = data['children']
    children.inject(0) {
      |count, entry|
      data = entry['data']
      count + data['num_comments']
    }
  end
end

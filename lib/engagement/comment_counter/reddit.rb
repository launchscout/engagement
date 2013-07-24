require 'snoo'

class Engagement::CommentCounter::Reddit
  def initialize
    @client = Snoo::Client.new
  end

  def comments_count(url)
    response = @client.search(url).parsed_response

    # Sometimes the Reddit API returns an Array, sometimes it returns a Hash.
    unless response.is_a?(Array)
      response = [response]
    end

    response.inject(0) do |count, listing|
      count + extract_count_from(listing)
    end
  end

  private

  def extract_count_from(response)
    return 0 unless response && response['data']

    children = response['data']['children']
    children.inject(0) { |count, entry|
      data = entry['data']
      count + (data['num_comments'] || 0)
    }
  end
end

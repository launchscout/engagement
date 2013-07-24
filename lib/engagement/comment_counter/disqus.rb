require 'disqus'

module Engagement
  class CommentCounter
    class Disqus

      def initialize(forum_api_key)
        @forum_api_key = forum_api_key
      end

      def comments_count(url)
        thread_id = thread_id_for(url)
        comments_count_for_thread_id thread_id
      end

      private

      def comments_count_for_thread_id(thread_id)
        counts = ::Disqus::Api.get_num_posts(thread_ids:[thread_id], forum_api_key: @forum_api_key)["message"]
        counts[thread_id].last
      end

      def thread_id_for(url)
        thread = ::Disqus::Api.get_thread_by_url(forum_api_key: @forum_api_key, url: url)
        thread['message']['id']
      end

    end
  end
end

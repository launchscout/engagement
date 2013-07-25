require 'disqus'

module Engagement
  class CommentCounter
    class Disqus

      def initialize(forum_api_key)
        @forum_api_key = forum_api_key
      end

      # When we don't own the thread we currently return 0 to prevent an 
      # exception from being raised. We're not sure that this is the best 
      # long-term solution.
      def comments_count(url)
        if (thread_id = thread_id_for(url))
          comments_count_for_thread_id thread_id
        else
          0
        end
      end

      private

      def comments_count_for_thread_id(thread_id)
        counts = ::Disqus::Api.get_num_posts(thread_ids:[thread_id], forum_api_key: @forum_api_key)["message"]
        counts[thread_id].last
      end

      def thread_id_for(url)
        thread = ::Disqus::Api.get_thread_by_url(forum_api_key: @forum_api_key, url: url)
        thread['message'] && thread['message']['id']
      end

    end
  end
end

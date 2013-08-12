# Engagement

A ruby gem for measuring the engagement of URLs on various social sites.

Right now this project is just useful for counting comments for URLs
on a variety of social sites. It may grow into something more useful
in the future.

## Installation

Add this line to your application's Gemfile:

    gem 'engagement'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install engagement

## Usage

```ruby
hacker_news = Engagement::CommentCounter::HackerNews.new
reddit      = Engagement::CommentCounter::Reddit.new
counter     = Engagement::CommentCounter.new([hacker_news, reddit])

counter.comments_count('http://gaslight.co/blog/why-we-wrote-a-blog') # => 17
```

or to use the threaded version which fetches the counts from each
service in a separate thread.

```ruby
counter = Engagement::CommentCounter::Threaded.new([hacker_news, reddit])
counter.comments_count('http://gaslight.co/blog/why-we-wrote-a-blog') # => 17
```

### HackerNews

```ruby
hacker_news = Engagement::CommentCounter::HackerNews.new
hacker_news.comments_count('http://gaslight.co/blog/why-we-wrote-a-blog') # => 9
```

### Reddit

```ruby
reddit = Engagement::CommentCounter::Reddit.new
reddit.comments_count('http://gaslight.co/blog/why-we-wrote-a-blog') # => 8
```

### Disqus

In order to fetch this data from Disqus you need to own the forum (in
Disqus's terminology) where the URL is owned.

```ruby
disqus = Engagement::CommentCounter::Disqus.new(forum_api_key)
disqus.comments_count('http://gaslight.co/blog/why-we-wrote-a-blog') # => 2
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

# Engagement

A ruby gem for measuring the engagement of URLs on various social sites.

## Installation

Add this line to your application's Gemfile:

    gem 'engagement'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install engagement

## Usage

```ruby
counter = Engagement::CommentCounter.new([hacker_news, reddit])
counter.comments_count('http://gaslight.co/blog/why-we-wrote-a-blog') # =>
```
or to use the threaded version

```ruby
counter = Engagement::CommentCounter::Threaded.new([hacker_news, reddit])
counter.comments_count('http://gaslight.co/blog/why-we-wrote-a-blog') # =>
```


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

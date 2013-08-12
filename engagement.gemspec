# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'engagement/version'

Gem::Specification.new do |spec|
  spec.name          = "engagement"
  spec.version       = Engagement::VERSION
  spec.authors       = ["Michael Guterl"]
  spec.email         = ["michael@diminishing.org"]
  spec.description   = %q{A ruby gem for measuring the engagement of URLs on various social sites.}
  spec.summary       = %q{Get comment counts from Reddit, HackerNews, and Disqus.}
  spec.homepage      = "https://github.com/gaslight/engagement"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'vcr'
  spec.add_development_dependency 'webmock'
  spec.add_development_dependency 'debugger'

  spec.add_dependency 'hacker_news_search', '~> 0.0.6'
  spec.add_dependency 'snoo'
  spec.add_dependency 'disqus'
end

require 'spec_helper'

describe Engagement::CommentCounter::Reddit do

  subject { counter.comments_count(url) }
  let(:counter) { Engagement::CommentCounter::Reddit.new }

  context 'with a single listing returned', :vcr do
    let(:url) { 'http://i.imgur.com/VzFTsGg.png' }
    it { should == 929 }
  end

  context 'with multiple listings returned', :vcr do
    let(:url) { 'http://gaslight.co/blog/why-we-wrote-a-blog' }
    it { should == 8 }
  end

  context 'with no results', :vcr do
    let(:url) { 'http://blog.gaslight.co/blog/why-i-chose-angularjs' }
    it { should == 0 }
  end

end

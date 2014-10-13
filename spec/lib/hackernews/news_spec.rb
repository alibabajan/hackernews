require_relative '../../spec_helper'

 
describe HackerNews::News do
 
  describe "default attributes" do
 
    it "has the base url set to the hackernews API endpoint" do
      expect(HackerNews::News.base_uri).to eq('http://api.ihackernews.com')
    end
 
  end

 end
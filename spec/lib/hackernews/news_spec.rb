require_relative '../../spec_helper'

 
describe HackerNews::News do
 
  describe "default attributes" do
 
    it {should respond_to(:items)}
    it "has the base url set to the hackernews API endpoint" do
      expect(HackerNews::News.base_uri).to eq('http://api.ihackernews.com')
    end
 
  end

  describe "get news items" do

    before do
      VCR.insert_cassette 'player', :record => :new_episodes
    end
   
    after do
      VCR.eject_cassette
    end
  end

 end
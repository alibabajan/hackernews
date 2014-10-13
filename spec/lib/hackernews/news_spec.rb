require_relative '../../spec_helper'

 
describe HackerNews::News do
 
  describe "default attributes" do
 
    it "has the base url set to the hackernews API endpoint" do
      expect(HackerNews::News.base_uri).to eq('http://api.ihackernews.com')
    end
 
  end

  describe "get_news" do
    let(:news) {HackerNews::News.get_news}
    before do
      VCR.insert_cassette 'news', :record => :new_episodes
    end
   
    after do
      VCR.eject_cassette
    end

    it "returns array of news objects" do
      expect(news.length).to be > 0
    end

    it "responds to news_item" do
       expect(news[0]).to respond_to(:news_item)
    end

   xit "reponds to original hash keys" do
    expect(news[0]).to respond_to("title")
   end
  end

 end
  require_relative '../../spec_helper'


describe HackerNews::Client do
  let(:client) {HackerNews::Client.new}
  describe "configure" do

    it "sets the api url" do
      client.configure do |conf|
        conf.api_url = 'https://hacker-news.firebaseio.com/v1/'
      end
      expect(client.api_url).to eq 'https://hacker-news.firebaseio.com/v1/'
    end
  end

  describe "top_stories" do

    before do
      VCR.insert_cassette 'top_stories', :record => :new_episodes
    end
    
    after do
      VCR.eject_cassette
    end
    
    it  "returns an array with the top 100 stories" do
      expect(client.top_stories).to be_instance_of Array
      expect(client.top_stories.length).to eq 100
    end
  end

  describe "story" do
    
    before do
      VCR.insert_cassette 'story', :record => :new_episodes
    end
    
    after do
      VCR.eject_cassette
    end
    
    it "returns a story object by id" do
      story = client.story(8863)
      expect(story.id).to eq(8863)
    end
  end

  describe "user" do
    
    before do
      VCR.insert_cassette 'user', :record => :new_episodes
    end
    
    after do
      VCR.eject_cassette
    end
    
    it "returns a user object by id" do
      user = client.user('jl')
      expect(user.id).to eq('jl')
    end
  end

  describe "updates" do
    
    before do
      VCR.insert_cassette 'updates', :record => :new_episodes
    end
    
    after do
      VCR.eject_cassette
    end
    
    it "returns latest item and profile changes" do
      updates = client.updates
      expect(updates.items).to_not be_nil
    end
  end

  describe "max_item" do
    
    before do
      VCR.insert_cassette 'max_item', :record => :new_episodes
    end
    
    after do
      VCR.eject_cassette
    end
    
    it "returns the current largest story id" do
      max_item = client.max_item
      expect(max_item).to_not be_nil
    end
  end

end
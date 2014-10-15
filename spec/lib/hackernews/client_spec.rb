require_relative '../../spec_helper'

 
describe HackerNews::Client do
let(:client) {HackerNews::Client.new}
describe "configure" do

  it "sets the api url" do
    # client = HackerNews::Client.new
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
  it  "returns array of story ids" do
    expect(client.top_stories).to be_instance_of Array
    expect(client.top_stories.length).to be > 0
  end
end

describe "story" do
  before do
    VCR.insert_cassette 'story', :record => :new_episodes
  end
 
  after do
    VCR.eject_cassette
  end

  it "returns a story object" do
    story = client.story(8863)
    expect(story).to_not be_nil
    expect(story.id).to eq(8863)
  end

end


end
module HackerNews

  class Client
    include HTTParty 
    attr_reader :api_url
    DEFAULT_API_URL = 'https://hacker-news.firebaseio.com/v0/'

    def initialize
      @api_url = DEFAULT_API_URL
      self.class.base_uri DEFAULT_API_URL
    end

    def api_url=(value)
      @api_url = value
      self.class.base_uri(value)
    end

    def configure
      yield self
    end

    def top_stories
      get('/topstories.json')
    end

    def story(story_id)
      get("/item/#{story_id}.json")
    end

     def user(id)
      get("/user/#{id}.json")
    end

    def updates
      get('/updates.json')
    end

    def max_item
      get('/maxitem.json')
    end


    def get(path)
      prepare(self.class.get(path))
    end

    def prepare(response)
      result = JSON.parse(response.parsed_response) rescue response.parsed_response
      result.is_a?(Hash) ? OpenStruct.new(result) : result
    end

  end
end
module HackerNews

  class News

    include HTTParty
    base_uri 'http://api.ihackernews.com'
    attr_reader :news_item

    def initialize(news_item)
      @news_item = news_item
    end

    def self.get_news
      get_items.map { |item|  new(item)}
    end



private
    def self.get_items
      get('/page')["items"]
    end

    def method_missing(name, *args, &block)
      news_item.has_key?(name.to_s) ? news_item[name.to_s] : super
    end 
  end

end

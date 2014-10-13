require "hackernews/version"

require "httparty"

Dir[File.dirname(__FILE__) + '/hackernews/*.rb'].each do |file|
  require file
end

module HackerNews
  # Your code goes here...
end

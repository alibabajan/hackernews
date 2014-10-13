#we need the actual library file
require_relative '../lib/hackernews'

 
#dependencies
require 'rspec'
require 'webmock/rspec'
require 'vcr'
 
#VCR config
VCR.configure do |c|
  c.cassette_library_dir = 'spec/fixtures/hackernews_cassettes'
  c.hook_into :webmock
end

RSpec.configure do |c|
  c.drb    = true
  c.color = true
  c.order = "random"
  # This is critical, don't remove it
  # c.formatter = 'NyanCatWideFormatter'
end

# #make sure our test suite can’t make external requests 
# WebMock.disable_net_connect!(allow_localhost: true)

# #stub any requests to api.github.com with Webmock, and returning pre-defined content.
# RSpec.configure do |config|
#   config.before(:each) do
#     stub_request(:get, /api.ihackernews.com/).
#       with(headers: {'Accept'=>'*/*', 'User-Agent'=>'Ruby'}).
#       to_return(status: 200, body: "stubbed response", headers: {})
#   end
# end
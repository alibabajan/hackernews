# Hackernews
[![Build Status](https://travis-ci.org/O-I/guardian_api.svg?branch=master)](https://travis-ci.org/O-I/guardian_api)
[![Coverage Status](https://img.shields.io/coveralls/O-I/hn_api.svg)](https://coveralls.io/r/O-I/hn_api?branch=master)

A Ruby wrapper for the [Hacker News API](https://github.com/HackerNews/API)

## Installation

Add this line to your application's Gemfile:

    gem 'hackernews'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install hackernews

## Usage

Configuration

```ruby
@client = HackerNews::Client.new

# linking to newest API version:
@client.configure do |conf|
        conf.api_url = 'https://hacker-news.firebaseio.com/v1/'
end
```

Get the current top 100 stories ids

```ruby
items = @client.top_stories
items.each do |item|
  @stories << @client.story(item)
end

# access stories
stories.first.title # Hacker News API
stories.first.url   # http://blog.ycombinator.com/hacker-news-api

# access comments
comment_ids = stories[0].kids
first_comment = @client.story(comment_ids.first)
first_comment.text
```
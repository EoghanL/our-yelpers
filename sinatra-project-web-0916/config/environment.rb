require 'bundler/setup'
Bundler.require

require_all('app/')

set :database, {adapter: "sqlite3", database: "db/database.sqlite3"}

require 'yelp'

Yelp.client.configure do |config|
  config.consumer_key = 'qVLws-6s3IdkwTzou0agAQ'
  config.consumer_secret = 'G5JFD8JPuDj2JPQJjgdTw0UkS7w'
  config.token = 'JI657osEsQ1Y2aOHaY5tz8vIqCZ_iQTw'
  config.token_secret = '7iAN9o9QlJf15Z6sqlp244bSYcM'
end

# Consumer Key	qVLws-6s3IdkwTzou0agAQ
# Consumer Secret	G5JFD8JPuDj2JPQJjgdTw0UkS7w
# Token	JI657osEsQ1Y2aOHaY5tz8vIqCZ_iQTw
# Token Secret	7iAN9o9QlJf15Z6sqlp244bSYcM
# Generate new API v2.0 token/secret

require 'yelp/fusion'

Yelp::Fusion.client.configure do |config|
  config.api_key = ENV.fetch('YELP_API_KEY')
end

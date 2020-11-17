source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.2'

gem 'rails', '~> 6.0.3', '>= 6.0.3.4'
gem 'puma', '~> 4.1'
gem 'webpacker', '~> 4.0'

gem 'bootsnap', '>= 1.4.2', require: false
gem 'jsonapi-serializer', '~> 2.1.0'
gem 'mongoid', '~> 7.1.5'
gem 'yelp-fusion'

group :development, :test do
  gem 'awesome_print', '~> 1.8.0'
  gem 'dotenv', '~> 2.7.6'
  gem 'pry-byebug', '~> 3.9.0'
end

group :development do
  gem 'foreman'
  gem 'listen', '~> 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end

group :test do
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  gem 'webdrivers'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

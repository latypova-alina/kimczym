source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.2.2"

gem "aws-sdk-dynamodb"
gem "dotenv-rails"
gem "interactor", "~> 3.0"
gem "puma", "~> 5.0"
gem "rails", "~> 7.0.8", ">= 7.0.8.3"
gem "telegram-bot"

group :development, :test do
  gem "byebug"
  gem "rspec-rails", "~> 6.1.0"
  gem "rubocop", require: false
end

group :development do
  gem "web-console"
end

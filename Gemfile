source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.2.2"

gem "rails", "~> 7.0.8", ">= 7.0.8.3"
gem "puma", "~> 5.0"
gem "dotenv-rails"
gem "interactor", "~> 3.0"
gem "telegram-bot"
gem "aws-sdk-dynamodb"

group :development, :test do
  gem "byebug"
end

group :development do
  gem "web-console"
end

group :test do
  gem "rspec"
end

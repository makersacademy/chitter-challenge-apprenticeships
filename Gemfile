# frozen_string_literal: true

source "https://rubygems.org"

git_source(:github) { |repo_name| "https://github.com/#{repo_name}" }

gem "pg"
gem "sinatra"
gem "bcrypt"
gem "sinatra-flash"
group :development, :test do
  gem "capybara"
  gem "rspec"
  gem "rubocop", "0.79.0"
  gem "simplecov", require: false
  gem "simplecov-console", require: false
  gem "sinatra-contrib"
end

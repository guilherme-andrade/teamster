# frozen_string_literal: true

source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

ruby '2.6.3'
gem 'rails', '~> 6.0.0'
gem 'suspenders', group: %i[development test]

gem 'activestorage-cloudinary-service'
gem 'autoprefixer-rails'
gem 'barby'
gem 'blind_index'
gem 'bootsnap', require: false
gem 'bourbon', '>= 5.0.1'
gem 'chunky_png'
gem 'cloudinary'
gem 'delayed_job_active_record'
gem 'devise'
gem 'devise-i18n'
gem 'geocoder'
gem 'high_voltage'
gem 'hiredis'
gem 'honeybadger'
gem 'i18n-js'
gem 'i18n-tasks'
gem 'inline_svg'
gem 'lockbox'
gem 'logstop'
gem 'measured-rails'
gem 'neat', '>= 3.0.1'
gem 'oj'
gem 'pg'
gem 'puma'
gem 'rack-canonical-host'
gem 'recipient_interceptor'
gem 'redis', '>= 4.0', require: %w[redis redis/connection/hiredis]
gem 'rails-i18n'
gem 'sassc-rails'
gem 'simple_form'
gem 'skylight'
gem 'sprockets', '>= 3.0.0'
gem 'stimulus_reflex', '~> 3.1'
gem 'title'
gem 'tzinfo-data', platforms: %i[mingw x64_mingw mswin jruby]
gem 'view_component'
gem 'webpacker'

group :production do
  gem 'rack-timeout'
end

group :development do
  gem 'listen'
  gem 'rack-mini-profiler', require: false
  gem 'spring'
  gem 'spring-commands-rspec'
  gem 'web-console'
end

group :development, :test do
  gem 'awesome_print'
  gem 'bullet'
  gem 'bundler-audit', '>= 0.5.0', require: false
  gem 'dotenv-rails'
  gem 'factory_bot_rails'
  gem 'pry-byebug'
  gem 'pry-rails'
  gem 'rspec-rails', '~> 3.6'
end

group :test do
  gem 'capybara-selenium'
  gem 'chromedriver-helper'
  gem 'formulaic'
  gem 'launchy'
  gem 'shoulda-matchers'
  gem 'simplecov', require: false
  gem 'timecop'
  gem 'webmock'
end

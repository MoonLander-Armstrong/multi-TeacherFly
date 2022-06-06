source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.1.1'

gem 'aws-sdk-s3', require: false
gem 'bootsnap', '>= 1.4.4', require: false
gem 'devise', '~> 4.2'
gem 'devise-i18n', '~> 1.10', '>= 1.10.2'
gem 'figaro', '~> 1.2'
gem 'image_processing', '~> 1.2'
gem 'jbuilder', '~> 2.7'
gem 'omniauth', '~> 2.1'
gem 'omniauth-google-oauth2', '~> 1.0', '>= 1.0.1'
gem 'omniauth-rails_csrf_protection', '~> 1.0', '>= 1.0.1'
gem 'paranoia', '~> 2.6'
gem 'pg', '~> 1.1'
gem 'puma', '~> 5.0'
gem 'pundit', '~> 2.2'
gem 'rails', '~> 6.1.5.1'
gem 'sass-rails', '>= 6'
gem 'turbolinks', '~> 5'
gem 'webpacker', '~> 5.0'
gem 'friendly_id', '~> 5.4', '>= 5.4.2'
gem 'aasm', '~> 4.11'
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
gem 'mini_magick', '~> 4.5', '>= 4.5.1'
gem 'streamio-ffmpeg', '~> 3.0', '>= 3.0.2'
gem "multi-tenant-support", "~> 1.5"
gem 'net-smtp', '~> 0.3.1'
gem "net-imap", "~> 0.2.3"
gem "net-pop", "~> 0.1.1"

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'rubocop', '~> 1.28', '>= 1.28.2'
end

group :development do
  gem 'foreman', '~> 0.87.2'
  gem 'listen', '~> 3.3'
  gem 'spring'
  gem 'web-console', '>= 4.1.0'
end

group :test do
  gem 'capybara', '>= 3.26'
  gem 'selenium-webdriver', '>= 4.0.0.rc1'
  gem 'webdrivers'
end

source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.0.2'
gem 'sqlite3'
gem 'puma', '~> 3.0'

gem 'bootstrap-sass', '~> 3.3.7'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'jquery-rails'
gem 'jquery-turbolinks'

gem 'font-awesome-rails'
gem 'bootstrap-select-rails'
gem 'bootstrap-toggle-rails'
gem 'twitter-typeahead-rails'
gem 'underscore-rails'
gem 'animate-rails'
gem 'momentjs-rails'
gem 'rails-sweetalert2-confirm'
gem 'rails-assets-sweetalert2', source: 'https://rails-assets.org'

gem 'simple_form', '~> 3.4'
gem 'paperclip'

gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'

gem 'devise', '~> 4.2.1'

group :development, :test do
  gem 'byebug', platform: :mri
  gem 'factory_girl_rails'
  gem 'faker'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.0.5'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

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

gem 'font-awesome-rails'
gem 'rails-sweetalert2-confirm'
gem 'rails-assets-sweetalert2', source: 'https://rails-assets.org'
gem 'bower-rails', '~> 0.11.0'

gem 'simple_form', '~> 3.4'
gem 'paperclip'
gem 'rqrcode'
gem 'kaminari'

gem 'jbuilder', '~> 2.5'

gem 'devise', '~> 4.2.1'
gem 'simple_token_authentication', '~> 1.0'
gem 'aescrypt'

group :development, :test do
  gem 'byebug', platform: :mri
  gem 'factory_girl_rails'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.0.5'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'capistrano',         require: false
  gem 'capistrano-rvm',     require: false
  gem 'capistrano-rails',   require: false
  gem 'capistrano-bundler', require: false
  gem 'capistrano-puma',   require: false
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

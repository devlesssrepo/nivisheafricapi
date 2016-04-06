source 'https://rubygems.org'

gem 'rails', github: "rails/rails"
gem 'ember-cli-rails', github: "thoughtbot/ember-cli-rails", branch: "sd-rails-5"
gem 'pg', '~> 0.18.4'
gem 'puma', '~> 3.0'
# gem 'jbuilder', '~> 2.0'
gem 'bcrypt', '~> 3.1.7'
gem 'aws-sdk', '~> 2'
gem 'carrierwave', github: 'carrierwaveuploader/carrierwave' 
gem 'mini_magick'
gem 'fog'
gem 'stripe'
gem 'jsonapi-resources', git: 'https://github.com/cerebris/jsonapi-resources.git',
                         branch: 'rails5'
# gem 'active_model_serializers'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development
# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
gem 'rack-cors'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platform: :mri
end

group :development do
  gem 'listen', '~> 3.0.5'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
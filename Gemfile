source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.0'
source 'https://rubygems.org'
ruby '2.0.0'


# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.0'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'

# Use CanCan to define User Roles
gem 'cancan'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'

#Setting Up PaperClip Photo Uploads with AmazonS3
gem "mongoid-paperclip", :require => "mongoid_paperclip"
gem 'aws-sdk', '~> 1.3.4'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

# Use ActiveModel has_secure_password
gem 'bcrypt-ruby'

gem 'omniauth-angellist', :git => 'https://github.com/wasabit/omniauth-angellist.git'

# APIs
gem 'httparty'

group :assets do
gem 'twitter-bootstrap-rails'
end 

group :production do
	gem 'thin'
	gem 'rails_12factor'
	gem "mongoid-paperclip", :require => "mongoid_paperclip"
	gem 'aws-sdk', '~> 1.3.4'
end



gem 'mongoid', github: 'mongoid/mongoid'

# gem 'carrierwave'
# gem 'carrierwave-mongoid', :require => 'carrierwave/mongoid'
# gem 'mongoid-grid_fs', github: 'ahoward/mongoid-grid_fs'

gem 'bcrypt-ruby'


gem 'sass-rails', '~> 4.0.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 1.2'
gem 'bootstrap-sass', '~> 2.3.2.2'
gem 'figaro'
gem 'high_voltage'
gem 'simple_form', '>= 3.0.0.rc'
group :development do
  gem 'better_errors'
  gem 'binding_of_caller', :platforms=>[:mri_19, :mri_20, :rbx]
  gem 'hub', :require=>nil
  gem 'quiet_assets'
  gem 'rails_layout'
  gem "mongoid-paperclip", :require => "mongoid_paperclip"
  gem 'aws-sdk', '~> 1.3.4'
	gem 'dotenv-rails'
	gem 'debugger'
end

group :test do
	gem 'dotenv-rails'
end


# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]

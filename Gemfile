source 'https://rubygems.org'

ruby '2.0.0'
gem 'rails', '4.0.1.rc3'
gem 'sass-rails', '~> 4.0.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 1.2'
gem 'devise'
gem 'devise_ldap_authenticatable'
gem 'bootstrap-sass', '2.3.2.0'
gem "therubyracer"
gem "less-rails" #Sprockets (what Rails 3.1 uses for its asset pipeline) supports LESS
gem "twitter-bootstrap-rails"
gem "cancan"
gem 'survey', :git => 'git://github.com/runtimerevolution/survey.git'
gem 'whenever', :require => false
gem 'rails_admin'


group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

group :development, :test do
  gem 'better_errors', '1.0.1'
  gem 'binding_of_caller', '0.7.2'
  gem 'sqlite3'
end
group :production do
  gem 'pg'
  gem 'rails_12factor'
end

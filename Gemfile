source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.3'

#gem 'pg'
#use mysql2 insteaf of postgres:
gem 'mysql2'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0.1'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '>=4.1.0'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# don't need the following since installation is done on a linux box with
# node.js installed.
# gem 'therubyracer',  platforms: :ruby

# use execjs as asset compiler. You have to have nodejs installed for this
gem 'execjs'

# Use jquery as the JavaScript library
gem 'jquery-rails'

#gem 'bootstrap-datepicker-rails'

#Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
#disable turbolinks, it breaks the app
#gem 'turbolinks'

#jquery-turbolinks requires:  //= require jquery.turbolinks
#it seems to solve the rails 4 and bootstrap3 incompatibility issue
#gem 'jquery-turbolinks'
#require jquery.turbolink and require turbolinks in application.js file

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'

# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

#annotation for models:
gem 'annotate', '~> 2.6.6'

#authentication
gem 'devise'
#dont use pundit for now
#gem 'pundit'
#gem 'rails_admin_pundit', :github => 'sudosu/rails_admin_pundit'

#forms
gem 'simple_form'

#layouts
gem 'bootstrap-sass'
gem 'font-awesome-sass'
gem 'font-awesome-rails'

#errors
gem 'better_errors'

# administration
gem 'rails_admin'
# administration theme:
gem 'rails_admin_flatly_theme', path: 'gems/rails_admin_flatly_theme'

#graphing tools
gem 'morrisjs-rails'
gem 'raphael-rails'

#jquery datatables
gem 'jquery-datatables-rails'

#server gem is you're running this without passenger apache server
#gem 'thin'
gem 'puma'

# new responders gem after it was extracted
gem 'responders', '~> 2.0'

#seed dump
gem 'seed-fu'

# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.7'

# scheduling
gem 'resque-scheduler'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Use debugger
#gem 'debugger', group: [:development, :test]

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
#gem 'tzinfo-data', platforms: [:mingw, :mswin]
#gem 'tzinfo', platforms: [:mingw, :mswin]

# for linux installation:
gem 'tzinfo-data'
gem 'tzinfo'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'

  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  
  gem 'derailed'
  gem 'stackprof'
  
end




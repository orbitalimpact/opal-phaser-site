source 'https://rubygems.org'

ruby '2.2.2'

gem 'volt', '0.9.5pre1'

gem 'volt-mongo'

gem 'opal-phaser', git: 'https://github.com/orbitalimpact/opal-phaser.git'

gem 'faye-websocket'
gem 'websocket-driver', '0.5.4'

# The following gem's are optional for themeing
# Twitter bootstrap
gem 'volt-bootstrap', '~> 0.0.10'

# Simple theme for bootstrap, remove to theme yourself.
gem 'volt-bootstrap_jumbotron_theme', '~> 0.1.0'

# User templates for login, signup, and logout menu.
gem 'volt-user_templates', '~> 0.1.3'

# gem 'rbnacl'
# gem 'rbnacl-libsodium'
gem 'uglifier', '>= 2.4.0', require: false
gem 'csso-rails', '~> 0.3.4', require: false

group :development, :test do
  # Testing dependencies
  gem 'rspec', '~> 3.2.0'
  gem 'opal-rspec', '~> 0.4.2'
  gem 'capybara', '~> 2.4.2'
  gem 'selenium-webdriver', '~> 2.43.0'
  gem 'chromedriver2-helper', '~> 0.0.8'
  gem 'poltergeist', '~> 1.5.0'
end

# Server for MRI
platform :mri do
  gem 'thin', '~> 1.6.0'
  gem 'bson_ext', '~> 1.9.0'
end

# Be sure to restart your server when you modify this file

# Specifies gem version of Rails to use when vendor/rails is not present
RAILS_GEM_VERSION = '2.3.4' unless defined? RAILS_GEM_VERSION

# Bootstrap the Rails environment, frameworks, and default configuration
require File.join(File.dirname(__FILE__), 'boot')

Rails::Initializer.run do |config|
  # Settings in config/environments/* take precedence over those specified here.
  # Application configuration should go into files in config/initializers
  # -- all .rb files in that directory are automatically loaded.

  # Add additional load paths for your own custom dirs
  # config.load_paths += %W( #{RAILS_ROOT}/extras )

  # Specify gems that this application depends on and have them installed with rake gems:install
  config.gem "warden",                                              :source => "http://gemcutter.org"
  config.gem "devise",                                              :source => "http://gemcutter.org"
  config.gem "inherited_resources", :lib => "inherited_resources",  :source => "http://gemcutter.org"
  config.gem "paperclip",           :lib => "paperclip",            :source => "http://gemcutter.org"
  config.gem "will_paginate",                                       :source => "http://gemcutter.org"
  

  # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
  # Run "rake -D time" for a list of tasks for finding time zone names.
  config.time_zone = 'Brasilia'

end
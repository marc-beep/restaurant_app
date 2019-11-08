require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module RestaurantApp
  class Application < Rails::Application
   # => This is an example of ALL available config options
    # => You're able to see exactly how it works here:
    # => https://github.com/richpeck/exception_handler/blob/master/lib/exception_handler/config.rb

    # => Config hash (no initializer required)
    config.exception_handler = {
      dev:        nil, # allows you to turn ExceptionHandler "on" in development
      db:         nil, # allocates a "table name" into which exceptions are saved (defaults to nil)
      email:      nil, # sends exception emails to a listed email (string // "you@email.com")   
    }  

    
    
    config.exception_handler = { dev: true }

    config.active_record.raise_in_transactional_callbacks = true
  end
end

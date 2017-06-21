require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module AjaxCrud
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
 
    
    # Sematic logger config
    config.rails_semantic_logger.started    = true
    config.rails_semantic_logger.processing = true
    config.rails_semantic_logger.rendered   = true
    config.semantic_logger.backtrace_level = :info
  end
end

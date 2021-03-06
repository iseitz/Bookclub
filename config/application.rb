require_relative 'boot'

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
# require "active_storage/engine"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "action_cable/engine"
require "sprockets/railtie"
require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Bookclub
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.

    ActionMailer::Base.smtp_settings = {

      :address              => 'smtp.gmail.com',
      :domain               => 'mail.google.com',
      :port                 => 587,
      :user_name            => 'bookapeclub@gmail.com', #ENV['GMAIL_USERNAME'],
      :password             => 'BooksAndFun2019&4', #ENV['GMAIL_PASSWORD'],
      :authentication       => 'login',
      :enable_starttls_auto => true
    }

  end
end

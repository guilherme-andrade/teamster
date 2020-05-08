# frozen_string_literal: true

require_relative 'boot'
require 'rails'
require 'active_model/railtie'
require 'active_job/railtie'
require 'active_record/railtie'
require 'active_storage/engine'
require 'action_controller/railtie'
require 'action_mailer/railtie'
require 'action_mailbox/engine'
require 'action_text/engine'
require 'action_view/railtie'
require 'action_cable/engine'
require 'sprockets/railtie'
require 'view_component/engine'
require 'barby'
require 'barby/barcode/code_128'
require 'barby/outputter/png_outputter'

Bundler.require(*Rails.groups)
module Teamster
  class Application < Rails::Application
    config.assets.quiet = true
    config.generators do |generate|
      generate.helper false
      generate.javascripts false
      generate.request_specs false
      generate.routing_specs false
      generate.stylesheets false
      generate.test_framework :rspec
      generate.view_specs false
    end
    config.middleware.use I18n::JS::Middleware
    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**/*.{rb,yml}').to_s]
    config.i18n.available_locales = [:pt]
    config.i18n.default_locale = :pt
    config.action_controller.action_on_unpermitted_parameters = :raise
    config.load_defaults 6.0
    config.generators.system_tests = nil
    config.active_job.queue_adapter = :delayed_job
  end
end

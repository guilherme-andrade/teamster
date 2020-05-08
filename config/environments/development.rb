# frozen_string_literal: true

Rails.application.configure do
  config.cache_classes = false
  config.eager_load = false
  config.cache_store = :redis_cache_store, {
    url: ENV.fetch('REDIS_URL') { 'redis://localhost:6379/1' }
  }

  config.session_store :cache_store,
                       key: '_session',
                       compress: true,
                       pool_size: 5,
                       expire_after: 1.year

  config.consider_all_requests_local = true
  if Rails.root.join('tmp', 'caching-dev.txt').exist?
    config.action_controller.perform_caching = true
    config.action_controller.enable_fragment_cache_logging = true
    # config.cache_store = :memory_store
    config.public_file_server.headers = {
    }
  else
    config.action_controller.perform_caching = false
    # config.cache_store = :null_store
  end
  config.active_storage.service = :cloudinary
  config.action_mailer.raise_delivery_errors = true
  config.after_initialize do
    Bullet.enable = true
    Bullet.bullet_logger = true
    Bullet.rails_logger = true
  end
  config.action_mailer.delivery_method = :file
  config.action_mailer.perform_caching = false
  config.active_support.deprecation = :log
  config.active_record.migration_error = :page_load
  config.active_record.verbose_query_logs = true
  config.assets.debug = true
  config.assets.quiet = true
  config.action_view.raise_on_missing_translations = false
  config.file_watcher = ActiveSupport::EventedFileUpdateChecker
  config.action_mailer.default_url_options = { host: 'localhost:3000' }
  config.action_mailer.asset_host = 'http://localhost:3000'
end

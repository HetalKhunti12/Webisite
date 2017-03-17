Rails.application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  # Code is not reloaded between requests.
  config.cache_classes = true

  # Eager load code on boot. This eager loads most of Rails and
  # your application in memory, allowing both threaded web servers
  # and those relying on copy on write to perform better.
  # Rake tasks automatically ignore this option for performance.
  config.eager_load = true

  #config.serve_static_assets = true
  config.assets.compile = true

  # Full error reports are disabled and caching is turned on.
  config.consider_all_requests_local       = false
  config.action_controller.perform_caching = true

  # Enable Rack::Cache to put a simple HTTP cache in front of your application
  # Add `rack-cache` to your Gemfile before enabling this.
  # For large-scale production use, consider using a caching reverse proxy like
  # NGINX, varnish or squid.
  # config.action_dispatch.rack_cache = true

  # Disable serving static files from the `/public` folder by default since
  # Apache or NGINX already handles this.
  config.serve_static_files = ENV['RAILS_SERVE_STATIC_FILES'].present?

  # Compress JavaScripts and CSS.
  config.assets.js_compressor = :uglifier
  # config.assets.css_compressor = :sass

  # Do not fallback to assets pipeline if a precompiled asset is missed.
  config.assets.compile = true

  # Asset digests allow you to set far-future HTTP expiration dates on all assets,
  # yet still be able to expire them through the digest params.
  config.assets.digest = true

  # `config.assets.precompile` and `config.assets.version` have moved to config/initializers/assets.rb

  # Specifies the header that your server uses for sending files.
  # config.action_dispatch.x_sendfile_header = 'X-Sendfile' # for Apache
  # config.action_dispatch.x_sendfile_header = 'X-Accel-Redirect' # for NGINX

  # Force all access to the app over SSL, use Strict-Transport-Security, and use secure cookies.
  # config.force_ssl = true

  # Use the lowest log level to ensure availability of diagnostic information
  # when problems arise.
  config.log_level = :debug

  # Prepend all log lines with the following tags.
  # config.log_tags = [ :subdomain, :uuid ]

  # Use a different logger for distributed setups.
  # config.logger = ActiveSupport::TaggedLogging.new(SyslogLogger.new)

  # Use a different cache store in production.
  # config.cache_store = :mem_cache_store

  # Enable serving of images, stylesheets, and JavaScripts from an asset server.
  # config.action_controller.asset_host = 'http://assets.example.com'

  # Ignore bad email addresses and do not raise email delivery errors.
  # Set this to true and configure the email server for immediate delivery to raise delivery errors.
  # config.action_mailer.raise_delivery_errors = false

  # Enable locale fallbacks for I18n (makes lookups for any locale fall back to
  # the I18n.default_locale when a translation cannot be found).
  config.i18n.fallbacks = true

  # Send deprecation notices to registered listeners.
  config.active_support.deprecation = :notify

  # Use default logging formatter so that PID and timestamp are not suppressed.
  config.log_formatter = ::Logger::Formatter.new

  # Do not dump schema after migrations.
  config.active_record.dump_schema_after_migration = false

  config.action_mailer.default_url_options = { host: 'website.itccrails.com.au'}
  config.action_mailer.delivery_method = :smtp
  # config.action_mailer.smtp_settings = {:address => "localhost"}

  config.action_mailer.perform_deliveries = true 
  config.action_mailer.raise_delivery_errors = true

  # config.action_mailer.smtp_settings = {
  #     :address              => "smtp.gmail.com",
  #     :port                 => 587,
  #     :domain               => "gmail.com",
  #     :user_name            => "itserviceyouth@gmail.com",
  #     :password             => "Badashah26",
  #     :authentication       => :plain,
  #     :enable_starttls_auto => true
  # }

  # config.action_mailer.smtp_settings = {
  #   :address              => "smtp.gmail.com",
  #   :port                 => 587,
  #   :domain               => "gmail.com",
  #   :user_name            => "mailer@logicbox.com.au",
  #   :password             => "TLBadmin2010?",
  #   :authentication       => "plain",
  #   :enable_starttls_auto => true
  # }

  config.action_mailer.smtp_settings = {
      :address              => "smtp.gmail.com",
      :port                 => 587,
      :domain               => "gmail.com",
      :user_name            => "itserviceyouth@gmail.com",
      :password             => "Badashah26",
      :authentication       => :plain,
      :enable_starttls_auto => true
  }

  config.paperclip_defaults = {
    storage: :s3,
    s3_credentials: {
      bucket: "entertainozmel",
      access_key_id: "AKIAI3VI3RJIVC4GLDHA",
      secret_access_key: "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",
      s3_region: "ap-southeast-2",
    }
  }

  config.after_initialize do
    ActiveMerchant::Billing::Base.mode = :test  # :production when you will use a real Pro Account
    ::GATEWAY = ActiveMerchant::Billing::PaypalGateway.new(
        login: "pankaj_api1.briskbrain.com",
        password: "R9CDMY6S86YF5P25",
        signature: "AFcWxV21C7fd0v3bYYYRCpSSRl31ABYvAjEktq72kKLYuGm.wTkc56wJ"
    )

    ::EWAYGATEWAY = ActiveMerchant::Billing::EwayGateway.new(
        login: "91582427",
        password: "l5HjzJVs"
    )
  end
end

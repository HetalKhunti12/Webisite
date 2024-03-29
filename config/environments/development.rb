Rails.application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  # In the development environment your application's code is reloaded on
  # every request. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false

  # Do not eager load code on boot.
  config.eager_load = false

  # Show full error reports and disable caching.
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false

  # Don't care if the mailer can't send.
  config.action_mailer.raise_delivery_errors = false

  # Print deprecation notices to the Rails logger.
  config.active_support.deprecation = :log

  # Raise an error on page load if there are pending migrations.
  config.active_record.migration_error = :page_load

  # Debug mode disables concatenation and preprocessing of assets.
  # This option may cause significant delays in view rendering with a large
  # number of complex assets.
  config.assets.debug = true

  # Asset digests allow you to set far-future HTTP expiration dates on all assets,
  # yet still be able to expire them through the digest params.
  config.assets.digest = true

  # Adds additional error checking when serving assets at runtime.
  # Checks for improperly declared sprockets dependencies.
  # Raises helpful error messages.
  config.assets.raise_runtime_errors = true

  # Raises error for missing translations
  # config.action_view.raise_on_missing_translations = true

  config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }
  config.action_mailer.delivery_method = :smtp
  # config.action_mailer.smtp_settings = {:address => "localhost"}

  config.action_mailer.perform_deliveries = true 
  config.action_mailer.raise_delivery_errors = true

  # Paperclip.options[:image_magick_path] = "/opt/ImageMagick/bin"
  # Paperclip.options[:command_path] = "/opt/ImageMagick/bin"

  config.action_mailer.smtp_settings = {
      :address              => "smtp.gmail.com",
      :port                 => 587,
      :domain               => "gmail.com",
      :user_name            => "itserviceyouth@gmail.com",
      :password             => "Badashah26",
      :authentication       => :plain,
      :enable_starttls_auto => true
  }

  s3 = Aws::S3::Client.new({
    :access_key_id => 'AKIAI3VI3RJIVC4GLDHA',
    :secret_access_key => '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',
    :region => 'ap-southeast-2',
  })


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

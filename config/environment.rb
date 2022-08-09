# Load the Rails application.
require_relative "application"

# Initialize the Rails application.
Rails.application.initialize!

  ActionMailer::Base.smtp_settings =  {
    user_name: "apikey", # This is the string literal 'apikey', NOT the ID of your API key
    password: "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", # This is the secret sendgrid API key which was issued during API key creation
    domain: "serene-shore-69287.herokuapp.com",
    address:"smtp.sendgrid.net",
    port: 587,
    authentication: :plain,
    enable_starttls_auto: true,

  }
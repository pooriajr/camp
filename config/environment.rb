# Load the Rails application.
require_relative "application"

Rails.application.configure do
  config.action_mailer.raise_delivery_errors = true
  config.action_mailer.perform_deliveries = true
  config.action_mailer.delivery_method = :smtp
end

ActionMailer::Base.smtp_settings = {
  :address => 'smtp-relay.sendinblue.com',
  :port => 587,
  :user_name => 'pjrashidi@gmail.com', 
  :password => Rails.application.credentials[:smtp_password],
  :authentication => :login,
  :enable_starttls_auto => true
}

# Initialize the Rails application.
Rails.application.initialize!

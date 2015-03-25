Rails.application.configure { |c| c.middleware.use RateLimiter, {store: Dalli::Client.new} }

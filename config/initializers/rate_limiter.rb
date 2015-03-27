Rails.application.configure { |c| c.middleware.use RateLimiter, limit: 100, store: Dalli::Client.new
}

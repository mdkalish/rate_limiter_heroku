Rails.application.configure { |c| c.middleware.use RateLimiter }

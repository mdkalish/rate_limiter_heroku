if Rails.env.production?
  Rails.application.configure { |c| c.middleware.use RateLimiter, store: Rails.cache.dalli }
else
  Rails.application.configure { |c| c.middleware.use RateLimiter, store: Dalli::Client.new }
end

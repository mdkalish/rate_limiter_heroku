Rails.application.configure { |c| c.middleware.use RateLimiter, limit: 100, store: Dalli::Client.new(
      (ENV['MEMCACHIER_SERVERS'] || '').split(','),
       {
         username: ENV['MEMCACHIER_USERNAME'],
         password: ENV['MEMCACHIER_PASSWORD'],
         failover: true,
         socket_timeout: 1.5,
         socket_failure_delay: 0.2
       }
      )
}

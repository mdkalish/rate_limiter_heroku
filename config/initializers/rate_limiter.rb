Rails.application.configure do |c|
  if Rails.env.production?
    c.middleware.use RateLimiter, limit: 100, store: client
  else
    c.middleware.use RateLimiter, limit: 100, store: Dalli::Client.new
  end
end

client = Dalli::Client.new((ENV["MEMCACHIER_SERVERS"] || "").split(","),
                           :username => ENV["MEMCACHIER_USERNAME"],
                           :password => ENV["MEMCACHIER_PASSWORD"],
                           :failover => true,
                           :socket_timeout => 1.5,
                           :socket_failure_delay => 0.2,
                           :value_max_bytes => 10485760)


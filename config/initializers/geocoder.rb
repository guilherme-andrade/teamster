Geocoder.configure(
  lookup: :google,
  ip_lookup: :maxmind,
  api_key: ENV['GOOGLE_SERVER_KEY'],
  timeout: 5,
  units: :km,
  cache: Redis.new,
  cache_prefix: "..."
)

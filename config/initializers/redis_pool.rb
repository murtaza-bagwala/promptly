class RedisPool

  def initialize
    client
  end

  def client
    @client ||= if Rails.env.test?
      MockRedis.new
    else
      initialize_redis_pool
    end
  end

  def initialize_redis_pool
    pool_size = ENV.fetch("RAILS_MAX_THREADS", 10)
    ConnectionPool.new(size: pool_size) do
      Redis.new(
        url: ENV['REDIS_URL'],
        ssl_params: { verify_mode: OpenSSL::SSL::VERIFY_NONE },
        timeout: ENV.fetch("REDIS_TIMEOUT", 1),
        reconnect_attempts: ENV.fetch("REDIS_RECONNECT_ATTEMPTS", 3),
        reconnect_delay: ENV.fetch("REDIS_RECONNECT_DELAY", 0.5),
        reconnect_delay_max: ENV.fetch("REDIS_RECONNECT_DELAY_MAX", 5)
      )
    end
  end

  def get(key)
    if Rails.env.test?
        @client.get(key)
    else
      @client.with do |conn|
        conn.get(key)
      end
    end
  end

  def set(key, val)
    if Rails.env.test?
        @client.set(key, val)
    else
      @client.with do |conn|
        conn.set(key, val)
      end
    end
  end

  def lpush(key, val)
    if Rails.env.test?
        @client.lpush(key, val)
    else
      @client.with do |conn|
        conn.lpush(key, val)
      end
    end
  end

  def llen(key)
    if Rails.env.test?
        @client.llen(key)
    else
      @client.with do |conn|
        conn.llen(key)
      end
    end
  end

  def rpop(key)
    if Rails.env.test?
        @client.rpop(key)
    else
      @client.with do |conn|
        conn.rpop(key)
      end
    end
  end

  def setex(key, exp, val)
    if Rails.env.test?
        @client.setex(key, exp, val)
    else
      @client.with do |conn|
        conn.setex(key, exp, val)
      end
    end
  end

  def del(key)
    if Rails.env.test?
        @client.del(key)
    else
      @client.with do |conn|
        conn.del(key)
      end
    end
  end

  def self.current=(redis_pool)
    @redis_pool = redis_pool
  end

  def self.current
    @redis_pool
  end
end

RedisPool.current = RedisPool.new

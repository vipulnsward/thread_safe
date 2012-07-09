module ThreadSafe
  class SynchronizedCacheBackend < NonConcurrentCacheBackend
    require 'mutex_m'
    include Mutex_m
    # WARNING: Mutex_m is a non-reentrant lock, so the synchronized methods are not allowed to call each other.

    def [](key)
      synchronize { super }
    end

    def []=(key, value)
      synchronize { super }
    end

    def put_if_absent(key, value)
      synchronize { super }
    end

    def key?(key)
      synchronize { super }
    end

    def delete(key)
      synchronize { super }
    end

    def clear
      synchronize { super }
    end

    private
    def dupped_backend
      synchronize { super }
    end
  end
end
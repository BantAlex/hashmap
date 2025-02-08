class Hashset

  def initialize
    @load_factor = nil
    @capacity = 16
    @buckets = Array.new(@capacity)
    @length = 0
  end

  def array_restriction(index)
    raise IndexError if index.negative? || index >= @buckets.length
  end

  def hash(key) #Convert the key into a cod. (Hash it)
    hash_code = 0
    prime_number = 31

    key.each_char { |char| hash_code = prime_number * hash_code + char.ord }

    hash_code
  end

  def set(key)
    hashed = self.hash(key)
    index = hashed % @capacity
    array_restriction(index)
    bucket = @buckets[index]

    return if bucket.include?(key)
    bucket << key
    length += 1
  end

  def get(key)
    hashed = self.hash(key)
    index = hashed % @capacity
    array_restriction(index)
    bucket = @buckets[index]
    return nil if bucket.nil?

    bucket.each do |set_key|
      return set_key if set_key == key
    end
    nil
  end

  def has?(key)
    return true if get(key)
    return false
  end

  def remove(key)
    hashed = self.hash(key)
    index = hashed % @capacity
    array_restriction(index)
    bucket = @buckets[index]
    return nil if bucket.nil?
    @buck_index = nil

    bucket.each_with_index do |pair, i|
      if pair[0] == key
        @buck_index = i
        break
      end
    end
    if @buck_index
      bucket.delete_at(@buck_index)
      @length -= 1
      return "Removed"
    else
      return nil
    end
  end

  def length
    @length
  end

  def clear
    initialize
  end

  def keys
    keys_arr = []
    @buckets.each do |bucket|
      next if bucket.nil?
      bucket.each do |key|
        keys_arr << key
      end
    end
    keys_arr
  end
end

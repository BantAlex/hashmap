class HashMap

  def initialize
    @load_factor = nil
    @capacity = 16
    @buckets = Array.new(@capacity) {[]}
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

  def set(key,value)
    hashed = self.hash(key)
    index = hashed % @capacity
    array_restriction(index)

    if @buckets[index].nil?
      new_bucket = []
      new_bucket << [key,value]
    else
      bucket = @buckets[index]
      bucket << [key,value]
    end

    @length += 1
  end

  def get(key)
    hashed = self.hash(key)
    index = hashed % @capacity
    array_restriction(index)
    bucket = @buckets[index]
    return nil if bucket.nil?
    bucket.each do |pair|
      return pair[1] if pair[0] == key
    end
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
    @buck_value = nil

    bucket.each_with_index do |pair, i|
      if pair[0] == key
        @buck_index = i
        @buck_value = pair[1]
        break
      end
    end
    if @buck_index
      bucket.delete_at(@buck_index)
      @length -= 1
      return @buck_value
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
      bucket.each do |pair|
        keys_arr << pair[0]
      end
    end
    keys_arr
  end

  def values
    values_arr = []
    @buckets.each do |bucket|
      next if bucket.nil?
      bucket.each do |pair|
        values_arr << pair[1]
      end
    end
    values_arr
  end

  def entries
    entries_arr = []
    @buckets.each do |bucket|
      next if bucket.nil?
      bucket.each do |pair|
        entries_arr << pair
      end
    end
    entries_arr
  end
end

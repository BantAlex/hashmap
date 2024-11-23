class HashMap
  # attr_accessor :load, :capacity

  def initialize
    self.load_factor = nil
    self.capacity = 16
    self.length
  end

  def array_restriction
    raise IndexError if index.negative? || index >= @buckets.length
  end

  def hash(key) #Convert the key into a cod. (Hash it)
    hash_code = 0
    prime_number = 31

    key.each_char { |char| hash_code = prime_number * hash_code + char.ord }

    hash_code
  end

  def set(key,value)

  end

  def get(key)

  end

  def has?(key)

  end

  def remove(key)

  end

  def length

  end

  def clear

  end

  def keys

  end

  def values

  end

  def entries

  end
end

class HashMap
  # attr_accessor :load, :capacity

  def initialize
    self.load = nil
    self.capacity = nil
  end

  def array_restriction
    raise IndexError if index.negative? || index >= @buckets.length
  end

  def hash(key)

  end
end

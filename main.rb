def array_restriction
  raise IndexError if index.negative? || index >= @buckets.length
end

require_relative 'lib/hash_map'
require_relative 'lib/hash_set'

hash_map = HashMap.new #the key is what the hash function will take as an input.
p hash_map.hash("bitch")

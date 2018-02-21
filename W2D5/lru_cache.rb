# Perhaps this is not a good implementaiton of a LRUCache because if we added
# multiples of the same line, then we would expect it to be the last element
# that we see in the array. We could improve its efficiency by creating a hash
# and for every object that is recieved, we set the amount of times we recieved
# this object. We check the amount of keys (0(1) operation) for the length.

class LRUCache

  attr_reader :cache, :size

  def initialize(size)
    @size = size
    @cache = []
  end

  def count
    self.cache.length
  end

  def add(el)
    self.cache.delete(el) if self.cache.include?(el)

    if self.cache.count < size
      self.cache.push(el)
    else
      self.cache.shift
      self.cache.push(el)
    end
  end

  def show
    p self.cache
  end

end

johnny_cache = LRUCache.new(4)

johnny_cache.add("I walk the line")
johnny_cache.add(5)

johnny_cache.count # => returns 2

johnny_cache.add([1,2,3])
johnny_cache.add(5)
johnny_cache.add(-5)
johnny_cache.add({a: 1, b: 2, c: 3})
johnny_cache.add([1,2,3,4])
johnny_cache.add("I walk the line")
johnny_cache.add(:ring_of_fire)
johnny_cache.add("I walk the line")
johnny_cache.add({a: 1, b: 2, c: 3})


johnny_cache.show # => prints [[1, 2, 3, 4], :ring_of_fire, "I walk the line", {:a=>1, :b=>2, :c=>3}]

# As you might have guessed, this is not the typical implementation of
# an LRU Cache. Any thoughts as to why?
#
# Let's consider the time complexity of the LRUCache#add method you wrote.
# In my solution it's O(n), where n is the size of the cache. For a large
# cache, that's a very lengthy process for simply adding one element.
# How might we improve the efficiency? Brainstorm some ways we might
# apply the ADTs from tonight's readings to do this.

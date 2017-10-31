 require_relative 'hash_item'
 
class HashClass

  def initialize(size)
    @items = Array.new(size)
  end

  def []=(key, value)
    size = @items.size
    if @items[index(key, @items.size)] == nil || @items[index(key, @items.size)].value == value
      @items[index(key, @items.size)] = HashItem.new(key, value)
    else
      while @items[index(key, size)] != nil
      resize
     end
      @items[index(key, @items.size)] = HashItem.new(key, value)
    end
  end

  def [](key)
    @items[index(key, @items.size)].value
  end

  def resize
    temp = @items
    @items = Array.new(temp.size*2)
    temp.each do |i|
      if i != nil
        self[i.key] = i.value
      end
    end
  end
  

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, size)
    key_value = key.sum
    index = key_value % size
    return index
  end
  
  # Simple method to return the number of items in the hash
  def size
    @items.count
  end

end
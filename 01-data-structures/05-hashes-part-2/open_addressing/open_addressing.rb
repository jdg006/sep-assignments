require_relative 'node'

class OpenAddressing
  def initialize(size)
    @items = Array.new(size)
  end

  def []=(key, value)
    node = Node.new(key,value)
    index = index(key,@items.size)
    if next_open_index(index) == -1
      resize
      self[key] = value
    else
      @items[next_open_index(index)] = node
      print
    end
  end

  def [](key)
    index = index(key,@items.size)
    while index != @items.size
      if @items[index].key == key
        return @items[index].value
      else
        index +=1
      end
    end
  end

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, size)
    key.sum % size
  end

  # Given an index, find the next open index in @items
  def next_open_index(index)
    while index != @items.size
      if @items[index] == nil
        return index
      else
        index +=1
      end
    end
    return -1
  end

  # Simple method to return the number of items in the hash
  def size
    @items.count
  end
  
  def print
    puts "start"
    puts "array size: #{@items.size}" 
    puts "load factor: #{self.load_factor}"
    @items.each_with_index do |val,index|
      if val == nil
        puts "open index location: #{index}"  
      else
        puts "#{val.key} <- #{val.value}. location: #{index}"
      end
    end
    puts "end"
  end
  
  def load_factor
    max_load_factor = 0.7
    values = 0
    @items.each do |i|
      if i != nil
        values += 1
      end
    end
    values.to_f / self.size
  end
  
  # Resize the hash
  def resize
    temp = @items
    @items = Array.new(temp.size * 2)
    temp.each do |i|
      if i != nil
        self[i.key] = i.value
      end
    end
  end
end
require_relative 'linked_list'

class SeparateChaining
  attr_reader :max_load_factor

  def initialize(size)
    @max_load_factor = 0.7
    @items = Array.new(size)
  end

  def []=(key, value)
    index = index(key,@items.size)
    if @items[index] == nil
       @items[index] = LinkedList.new
       @items[index].add_to_front(Node.new(key,value))
       print
    elsif @items[index] != nil and @items[index].size < 5
       @items[index].add_to_front(Node.new(key,value))
       print
    else
      resize
      self[key] = value
    end
    load_factor
  end

  def [](key)
    value = nil
    @items.each do |i|
      if i == nil
      elsif i.find_node_where(key) != nil
        value = i.find_node_where(key).value
      end
    end
      value
  end

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, size)
    key.sum % size
  end

  # Calculate the current load factor
  def load_factor
    values = 0
    @items.each do |i|
      if i != nil
        values += i.size
      end
    end
    if values.to_f / self.size > max_load_factor
      resize
    end
    values.to_f / self.size
  end
  
  # Simple method to return the number of items in the hash
  def size
    @items.count
  end

  # Resize the hash
  def resize
    temp = @items
    values = []
    @items = Array.new(temp.size * 2)
    temp.each do |i|
      if i != nil
        value = i.head
        values.push(value)
        while value.next != nil
          value = value.next
          values.push(value)
        end
      end
    end
    values.each do |x|
      self[x.key]= x.value
    end
  end
  
  def print
    puts "start"
    puts "array size: #{@items.size}"
    puts "Load Factor: #{load_factor}"
    @items.each_with_index do |val, i|
      if val == nil
        puts "open index. Location: #{i}"
      else
        puts "linked list Location: #{i}"
        puts "linked list contents:"
        puts val.print
        puts "end linked list contents"
      end
    end
    puts "end"
  end

end

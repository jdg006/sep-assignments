class MyQueue
  attr_accessor :head
  attr_accessor :tail

  def initialize
    @queue = Array.new
    @head = @queue[0]
    @tail = @queue[-1]
  end

  def enqueue(element)
    if @queue.count === 0
    @queue.insert(0,element)
  else
    @queue.insert(@queue.count, element)
    
  end
  @head = @queue[0]
  @tail = @queue[-1]
  end

  def dequeue
    @queue.slice!(0)
    @head = @queue[0]
    @tail = @queue[-1]
  end

  def empty?
    if @queue.count === 0
      return true
    else
      return false
    end
  end
end
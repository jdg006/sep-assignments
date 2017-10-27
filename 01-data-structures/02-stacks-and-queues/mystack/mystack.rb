class MyStack
  attr_accessor :top

  def initialize
    @stack = Array.new
    self.top = nil
  end

  def push(item)
       @stack.insert(0, item)
       self.top = @stack[0] 
  end

  def pop
    item = @stack.slice!(0)
    self.top = @stack[0]
    item
  end

  def empty?
    if @stack.count === 0
      return true
    else 
      return false
    end
  end
end
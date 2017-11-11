require_relative 'node'

class BinaryHeap
  attr_accessor :backbone
  attr_accessor :root

  def initialize(root)
    @right = nil
    @left = nil
    @root = root
    @backbone = [nil, @root]
  end
  
  def insert(node)
    if node == nil
        return nil
    elsif @backbone.size == 1
      @backbone.push(node)
    else
      count = 1
      while count < @backbone.size && @backbone[count].rating < node.rating
        count +=1
      end
      @backbone.insert(count, node)
    end
    
    @root = @backbone[1]
    @backbone.each_with_index do |value, i|
      if value != nil
        value.left = @backbone[i * 2]
        value.right = @backbone[i * 2 + 1 ]
      end
    end
  end
  
  def find(root, title)
    if title == nil
      return nil
    elsif root == nil
      return "no root"
    elsif root.title == title
      return root
    else
      
      if root.right != nil && root.left != nil
        right = find(root.right, title)
        if right != nil 
          return right
        else 
          find(root.left, title)
        end
      elsif root.right != nil 
         find(root.right, title)
      elsif root.left != nil 
         find(root.left, title)
      end
    end
  end
  
  
  def delete(root, title)
    node = find(root, title)
    @backbone.delete(node)
    
    @root = @backbone[1]
    @backbone.each_with_index do |value, i|
      if value != nil
        value.left = @backbone[i * 2]
        value.right = @backbone[i * 2 + 1 ]
      end
    end
  end
  
  def printf
    return nil if @root.nil?
    print_array = []
    queue = Queue.new
    queue.enq(@root)
    while !queue.empty?
      value = queue.deq
      print_array.push(value) if !value.nil?
      queue.enq(value.left) if value.left
      queue.enq(value.right) if value.right
    end
    output_string = ""
    print_array.each do |i|
      if i != nil
        output_string += "#{i.title}: #{i.rating}\n"
      end
    end
    puts output_string
  end
  
  def print_alternate
    @backbone.each do |i|
      puts i
      end
  end
  
end

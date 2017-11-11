require_relative 'node'

class BinarySearchTree
  attr_accessor :root

  def initialize(root)
    @right = nil
    @left = nil
    @root = root
  end

  def insert(root, node)
    if root.rating > node.rating 
      if root.left == nil
        root.left = node
      else
        root = root.left
        insert(root, node)
      end
    else
      if root.right == nil
        root.right = node
      else
        root = root.right
        insert(root, node)
      end
    end
  end

  # Recursive Depth First Search
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
  
  def delete(root, data)
    if data == nil || root == nil
      return nil
    else
      node = find(root, data)
      parent = find_parent_of(root, node)
      children_of_parent = find_children_of(parent)
      if parent != nil
        parent.right = nil
        parent.left = nil
      else
      end
      if children_of_parent != nil
      children_of_parent.each do |i|
        if i != nil && i != node
          insert(root, i)
        end
      end
     end
    end
  end
  
  def find_parent_of(root, node)
    if root.right == node || root.left == node
      return root
    else
      if root.right != nil && root.left != nil
        find_parent_of(root.right, node)
        find_parent_of(root.left, node)
      elsif root.right != nil 
        find_parent_of(root.right, node)
      elsif root.left != nil 
        find_parent_of(root.left, node)
      end
    end
  end
  
  def find_children_of(parent)
    children = []
    if parent == nil
      return nil
    end
    
    if parent.left != nil
      children.push(parent.left)
      find_children_of(parent.left).each do |x|
        children.push(x)
      end
    end
      
    if parent.right != nil
      children.push(parent.right)
      find_children_of(parent.right).each do |i|
        children.push(i)
      end
    end
    
    return children
  end
  # Recursive Breadth First Search
  
  def printf(children=nil)
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
      output_string += "#{i.title}: #{i.rating}\n"
    end
    puts output_string
  end
  
  def print_alternate
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
    print_array.each do |i|
      puts i
    end
  end

end

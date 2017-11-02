require_relative 'node'

class LinkedList
   attr_accessor :head
   attr_accessor :tail

  # This method creates a new `Node` using `data`, and inserts it at the end of the list.
  def add_to_tail(node)
    if @tail == nil
      @tail = node
      @head = node
    else
      @tail.next = node
      @tail = node
    end
  end

  # This method removes the last node in the lists and must keep the rest of the list intact.
  def remove_tail
     if @head == @tail
       @head = nil
       @tail = nil
     else
       temp = @head
       while temp.next != @tail
        temp = temp.next
       end
       temp.next = nil
       @tail = temp
     end
  end

  # This method prints out a representation of the list.
  def print
    print_array = []
    temp = @head
    while temp.next != nil 
    print_array.push(temp)
    temp = temp.next
    end
    print_array.push(@tail)
    print_array.each do |i| 
      puts "#{i.key} <- #{i.value}"
    end
  end

  # This method removes `node` from the list and must keep the rest of the list intact.
  def delete(node)
    temp = @head
    previous = nil
    while temp != node
      previous = temp
      temp = temp.next
    end
    if previous == nil && temp.next == nil
      @head = nil
      @tail = nil
    elsif previous == nil 
      @head = temp.next
    elsif temp.next == nil
      @tail = previous
    else
      previous.next = temp.next
    end
  end

  # This method adds `node` to the front of the list and must set the list's head to `node`.
  def add_to_front(node)
    if @head == nil
      @head = node
      @tail = node
    else
    node.next = @head
    @head = node
    end
  end

  # This method removes and returns the first node in the Linked List and must set Linked List's head to the second node.
  def remove_front
    temp = @head
    @head = @head.next
    temp
  end
  
  def find(node)
    temp = @head
    while temp != node 
      if temp.next == nil and temp != node
        return nil
      else
        temp = temp.next
     end
    end 
    temp
  end
  
  def find_node_where(key)
    temp = @head
    while temp.key != key 
      if temp.next == nil 
        return nil
      else
        temp = temp.next
     end
    end 
    temp
  end
  
  def size
    count = 1
    temp = @head
    while temp.next != nil
      count += 1
      temp = temp.next
    end
    count
  end
end
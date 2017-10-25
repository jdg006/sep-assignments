require 'benchmark'
require_relative 'linked_list'
require_relative 'node'

linked_list = LinkedList.new
array = []
puts "add 10,000 elements to each list"
puts Benchmark.measure {10000.times do |i| linked_list.add_to_front(Node.new(i)) end}
puts Benchmark.measure {10000.times do |i| array.push(i) end}
node = linked_list.find_node_where(5000)
puts "access 5000th element"
puts Benchmark.measure {linked_list.find(node)}
puts Benchmark.measure {array[5000]}
puts "removes 5000th element"
puts Benchmark.measure {linked_list.delete(node)}
puts Benchmark.measure {array.delete_at(5000)}









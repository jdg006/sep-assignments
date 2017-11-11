require 'benchmark'
require_relative 'node'
require_relative 'min_heap'
require_relative 'binary_search_tree'

 node = Node.new(0,0)
 heap = BinaryHeap.new(node)
 binary_tree = BinarySearchTree.new(node)
 
 
 puts "add 10,000 elements to each tree"
 puts "Heap: #{Benchmark.measure {10000.times do |i| heap.insert(Node.new(i,i)) end}}"
 puts "Binary tree: #{Benchmark.measure {10000.times do |i| binary_tree.insert(binary_tree.root, Node.new(i,i)) end}}"
 puts "Find 5000th entry"
 puts "Heap: #{Benchmark.measure {heap.find(heap.root, 5000)}}"
 puts "Binary tree: #{Benchmark.measure {binary_tree.find(binary_tree.root, 5000)}}"
 puts "delete 5000th element"
 puts "Heap: #{Benchmark.measure {heap.delete(heap.root, 5000)}}"
 puts "Binary tree: #{Benchmark.measure {binary_tree.delete(binary_tree.root, 5000)}}"
 
 node = Node.new(0,0)
 heap = BinaryHeap.new(node)
 binary_tree = BinarySearchTree.new(node)
 
 4.times do |i| heap.insert(Node.new(i,i)) end
 4.times do |i| binary_tree.insert(binary_tree.root, Node.new(i,i)) end
puts "heap"
 heap.print_alternate
puts "binary_tree"
 binary_tree.print_alternate
 
 
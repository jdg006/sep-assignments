require 'benchmark'
require_relative 'linked_list'
require_relative 'node'

linked_list = LinkedList.new

puts Benchmark.measure {10000.times do |i|
    linked_list.add_to_front(Node.new("a"))
end}
puts Benchmark.measure {array = Array.new(10000) {rand(1...9)}}






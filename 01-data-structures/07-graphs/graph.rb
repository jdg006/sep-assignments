require_relative 'node'

class Graph
    attr_accessor :nodes
    def initialize
       @nodes = []
       @root = @nodes[0]
    end
    
    def insert(node)
        @nodes.push(node)
    end
    
    def find(node)
        (@nodes.select {|x| x == node})[0]
    end
    
    def find_films_of(node)
        node.film_actor_hash.keys
    end
    
    def find_kevin_bacon(node)
       return nil if node == nil
       films = []
       node_movie = find_films_of(node)[0]
       next_node = node.film_actor_hash[node_movie][0]
       
        if node_movie != "Footloose"
            films.push(node_movie)
            array = find_kevin_bacon(next_node)
            films.push(array)
            films.flatten!
        else
            films.push(node_movie)
            
            return films
        end
        
    end
   
end


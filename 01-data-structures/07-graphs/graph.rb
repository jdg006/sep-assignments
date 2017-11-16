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
    
    def find_actors_in(title)
        
    end
    
    
    def find_kevin_bacon(node)
       return nil if node == nil
       return "this is kevin bacon" if node.name == "Kevin Bacon"
       films = []
       node_movies = node.film_actor_hash
       node_movies.each do |key, array|
           array.each do |x|
               if x.name == "Kevin Bacon"
                   films.push(key)
               end
           end
       end
       if films.size == 0
           films.push(find_films_of(node)[1])
           node.film_actor_hash[find_films_of(node)[0]].each do |x|
               find_kevin_bacon(x)
           end
           
       else
           
       return films
       
      end
    end
end


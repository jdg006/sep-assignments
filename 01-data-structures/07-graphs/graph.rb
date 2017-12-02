require_relative 'node'

class Graph
    attr_accessor :nodes
    def initialize
       @nodes = []
       @root = @nodes[0]
    end
    
    def find_kev(node)
        
        queue = []
        films = []
        visited = []
        
        visited << node
        queue << node
        
        while queue.any?
        
          current_node = queue.shift 
          
          if current_node.name == "Kevin Bacon"
            return films
          end
          
          find_films_of(current_node).each do |title|
              if title == "Footloose"
                  films.push(title)
                  return films
              end
                current_node.film_actor_hash[title].each do |actor|
                  next if visited.include?(actor) || find_films_of(actor).size == 1
                  queue.push(actor)
                  visited.push(actor)
                  films.push(title) if !films.include?(title)
                end
            end
        end
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


  

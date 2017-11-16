include RSpec

require_relative 'graph'
require_relative 'node'

RSpec.describe Graph, type: Class do
  
  let (:kevin) {Hash.new}
  let (:john)  {Hash.new}
  let (:sarah) {Hash.new}
  let (:chris) {Hash.new}
  let (:matthew) {Hash.new}
  let (:ellen)  {Hash.new}
  let (:anne) {Hash.new}
  let (:dennis) {Hash.new}
  let (:ashton) {Hash.new}
  let (:steve)  {Hash.new}
  let (:harvey) {Hash.new}
  let (:robert) {Hash.new}
  let (:michael) {Hash.new}
  let (:tim)  {Hash.new}
  let (:samuel) {Hash.new}
  
  let (:graph) { Graph.new }
  let (:kevin_bacon) { Node.new("Kevin Bacon")}
  let (:john_lithgow) {Node.new("John Lithgow")}
  let (:sarah_jessica_parker) {Node.new("Sarah Jessica Parker")}
  let (:chris_penn) {Node.new("Chris Penn")}
  let (:matthew_mcConaughey) {Node.new("Matthew McConaughey")}
  let (:ellen_burstyn) {Node.new("Ellen Burstyn")}
  let (:anne_hathaway) {Node.new("Anne Hathaway")}
  let (:dennis_quaid) {Node.new("Dennis Quaid")}
  let (:ashton_holmes) {Node.new("Ashton Holmes")}
  let (:steve_buschemi) {Node.new("Steve Buschemi")}
  let (:harvey_keitel) {Node.new("Harvey Keitel")}
  let (:robert_haley) {Node.new("Robert Haley")}
  let (:michael_madsen) {Node.new("Michael Madsen")}
  let (:tim_roth) {Node.new("Tim Roth")}
  let (:samuel_jackson) {Node.new("Samuel Jackson")}
  
  describe "#insert(data)" do
    
    it "properly inserts a new node" do
      graph.insert(kevin_bacon)
      expect(graph.nodes).to eq [kevin_bacon]
    end
    
    it "properly inserts multiple nodes" do
      graph.insert(kevin_bacon)
      graph.insert(john_lithgow)
      graph.insert(sarah_jessica_parker)
      graph.insert(chris_penn)
      expect(graph.nodes).to eq [kevin_bacon, john_lithgow, sarah_jessica_parker, chris_penn]
    end
   end
   
   describe "# find(node)" do
     it "returns the correct node in the graph" do
       graph.insert(kevin_bacon)
       graph.insert(john_lithgow)
       graph.insert(sarah_jessica_parker)
       graph.insert(chris_penn)
       expect(graph.find(kevin_bacon)).to eq kevin_bacon
     end
   end
   
   describe "find_kevin_bacon" do
     it "returns 'this is kevin bacon' if searched node is kevin bacon" do 
       kevin = {"Footloose" => [john_lithgow, sarah_jessica_parker, chris_penn]}
       kevin_bacon.film_actor_hash = kevin
       graph.insert(kevin_bacon)
       expect(graph.find_kevin_bacon(kevin_bacon)).to eq []
     end
     
     it "properly finds the movies that connect the starting node to Kevin Bacon" do 
       kevin = {
      "Footloose" => [john_lithgow, sarah_jessica_parker, chris_penn]
    }
  
    john = {
      "Footloose" => [kevin_bacon, chris_penn, sarah_jessica_parker],
      "Interstellar" => [matthew_mcConaughey, ellen_burstyn, anne_hathaway]
    }
    
    matthew = {
      "Interstellar" => [john_lithgow, ellen_burstyn, anne_hathaway]
    }
    
    ellen = {
      "Interstellar" => [john_lithgow, matthew_mcConaughey, anne_hathaway]
    }
    
    anne = {
      "Interstellar" => [john_lithgow, matthew_mcConaughey, ellen_burstyn]
    }
    
    sarah = {
      "Footloose" => [kevin_bacon, chris_penn, john_lithgow],
      "Smart People" => [dennis_quaid, ashton_holmes, robert_haley]
    }
    
    dennis = {
      "Smart People" => [sarah_jessica_parker, ashton_holmes, robert_haley]
    }
    ashton = {
      "Smart People" => [sarah_jessica_parker, dennis_quaid, robert_haley]
    }
    robert = {
      "Smart People" => [sarah_jessica_parker, ashton_holmes, dennis_quaid]
    }
    
    chris = {
      "Footloose" => [kevin_bacon, john_lithgow, sarah_jessica_parker],
      "Reservior Dogs" => [steve_buschemi, harvey_keitel, michael_madsen]
    }
    
    steve = {
      "Reservior Dogs" => [chris_penn, harvey_keitel, michael_madsen]
    }
    
    harvey = {
      "Reservior Dogs" => [steve_buschemi, chris_penn, michael_madsen],
      "Pulp Fiction" => [samuel_jackson, tim_roth]
    }
    
    michael = {
      "Reservior Dogs" => [steve_buschemi, harvey_keitel, chris_penn]
    }
    
    samuel = {
      "Pulp Fiction" => [harvey_keitel, tim_roth]
    }
    
    tim = {
      "Pulp Fiction" => [harvey_keitel, samuel_jackson]
    }
    
  kevin_bacon.film_actor_hash = kevin
  john_lithgow.film_actor_hash = john
  sarah_jessica_parker.film_actor_hash = sarah
  chris_penn.film_actor_hash = chris
  matthew_mcConaughey.film_actor_hash = matthew
  ellen_burstyn.film_actor_hash = ellen
  anne_hathaway.film_actor_hash = anne
  dennis_quaid.film_actor_hash = dennis
  ashton_holmes.film_actor_hash = ashton
  steve_buschemi.film_actor_hash = steve
  harvey_keitel.film_actor_hash = harvey
  robert_haley.film_actor_hash = robert
  michael_madsen.film_actor_hash = michael
  tim_roth.film_actor_hash = tim
  samuel_jackson.film_actor_hash = samuel
       
  graph.insert(kevin_bacon)
  graph.insert(john_lithgow)
  graph.insert(sarah_jessica_parker)
  graph.insert(chris_penn)
  graph.insert(matthew_mcConaughey)
  graph.insert(ellen_burstyn)
  graph.insert(anne_hathaway)
  graph.insert(dennis_quaid)
  graph.insert(ashton_holmes)
  graph.insert(steve_buschemi)
  graph.insert(harvey_keitel)
  graph.insert(robert_haley)
  graph.insert(michael_madsen)
  graph.insert(tim_roth)
  graph.insert(samuel_jackson)
  
  expect(graph.find_kevin_bacon(john_lithgow)).to eq ["Footloose"]
  expect(graph.find_kevin_bacon(matthew_mcConaughey)).to eq ["Footloose", "Interstellar"]
     end
     
   end
   
 end

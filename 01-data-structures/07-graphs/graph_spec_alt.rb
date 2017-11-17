include RSpec

require_relative 'graph'
require_relative 'node'

RSpec.describe Graph, type: Class do
  
  let (:graph) { Graph.new }
  
  let (:kevin_bacon) { Node.new("Kevin Bacon", {
      "Footloose" => [john_lithgow, sarah_jessica_parker, chris_penn]
    })}
  let (:john_lithgow) {Node.new("John Lithgow",{
      "Footloose" => [kevin_bacon, chris_penn, sarah_jessica_parker],
      "Interstellar" => [matthew_mcConaughey, ellen_burstyn, anne_hathaway]
    })}
  let (:sarah_jessica_parker) {Node.new("Sarah Jessica Parker", {
      "Footloose" => [kevin_bacon, chris_penn, john_lithgow],
      "Smart People" => [dennis_quaid, ashton_holmes, robert_haley]
    })}
  let (:chris_penn) {Node.new("Chris Penn", {
      "Footloose" => [kevin_bacon, john_lithgow, sarah_jessica_parker],
      "Reservior Dogs" => [steve_buschemi, harvey_keitel, michael_madsen]
    })}
  let (:matthew_mcConaughey) {Node.new("Matthew McConaughey", {
      "Interstellar" => [john_lithgow, ellen_burstyn, anne_hathaway]
    })}
  let (:ellen_burstyn) {Node.new("Ellen Burstyn", {
      "Interstellar" => [john_lithgow, matthew_mcConaughey, anne_hathaway]
    })}
  let (:anne_hathaway) {Node.new("Anne Hathaway", {
      "Interstellar" => [john_lithgow, matthew_mcConaughey, ellen_burstyn]
    })}
  let (:dennis_quaid) {Node.new("Dennis Quaid", {
      "Smart People" => [sarah_jessica_parker, ashton_holmes, robert_haley]
    })}
  let (:ashton_holmes) {Node.new("Ashton Holmes", {
      "Smart People" => [sarah_jessica_parker, dennis_quaid, robert_haley]
    })}
  let (:steve_buschemi) {Node.new("Steve Buschemi", {
      "Reservior Dogs" => [chris_penn, harvey_keitel, michael_madsen]
    })}
  let (:harvey_keitel) {Node.new("Harvey Keitel", {
      "Reservior Dogs" => [chris_penn, steve_buschemi, michael_madsen],
      "Pulp Fiction" => [samuel_jackson, tim_roth]
    })}
  let (:robert_haley) {Node.new("Robert Haley", {
      "Smart People" => [sarah_jessica_parker, ashton_holmes, dennis_quaid]
    })}
  let (:michael_madsen) {Node.new("Michael Madsen", {
      "Reservior Dogs" => [steve_buschemi, harvey_keitel, chris_penn]
    })}
  let (:tim_roth) {Node.new("Tim Roth", {
      "Pulp Fiction" => [harvey_keitel, samuel_jackson],
      "The Hateful eight" => [kurt_russell, bruce_dern]
    })}
  let (:samuel_jackson) {Node.new("Samuel Jackson", {
      "Pulp Fiction" => [harvey_keitel, tim_roth]
    })}
  let (:kurt_russell) {Node.new("Kurt Russell", {
      "The Hateful eight" => [tim_roth, bruce_dern]
    })}
  let (:bruce_dern) {Node.new("Bruce Dern", {
      "The Hateful eight" => [tim_roth, kurt_russell]
    })}
    
    
   describe "#insert(data)" do
    
    it "properly inserts a new node" do
      graph.insert(bruce_dern)
    end
   end
 end

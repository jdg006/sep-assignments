include RSpec

require_relative 'min_heap'

RSpec.describe BinaryHeap, type: Class do
  
  let (:root) { Node.new("The Matrix", 87) }
  let (:tree) { BinaryHeap.new(root) }
  let (:pacific_rim) { Node.new("Pacific Rim", 72) }
  let (:braveheart) { Node.new("Braveheart", 78) }
  let (:jedi) { Node.new("Star Wars: Return of the Jedi", 80) }
  let (:donnie) { Node.new("Donnie Darko", 85) }
  let (:inception) { Node.new("Inception", 86) }
  let (:district) { Node.new("District 9", 90) }
  let (:shawshank) { Node.new("The Shawshank Redemption", 91) }
  let (:martian) { Node.new("The Martian", 92) }
  let (:hope) { Node.new("Star Wars: A New Hope", 93) }
  let (:empire) { Node.new("Star Wars: The Empire Strikes Back", 94) }
  let (:mad_max_2) { Node.new("Mad Max 2: The Road Warrior", 98) }
  

  describe "#insert(data)" do
    it "properly inserts a new node as a left child" do
      tree.insert(district)
      expect(root.left.title).to eq "District 9"
    end

    it "properly inserts a new node as a right child" do
      tree.insert(district)
      tree.insert(shawshank)
      expect(root.right.title).to eq "The Shawshank Redemption"
    end
    
    it "properly inserts a new node as a left left child" do
      tree.insert(district)
      tree.insert(shawshank)
      tree.insert(martian)
      expect(root.left.left.title).to eq "The Martian"
    end
    
    it "properly inserts a new node as a left right child" do
      tree.insert(district)
      tree.insert(shawshank)
      tree.insert(martian)
      tree.insert(hope)
      expect(root.left.right.title).to eq "Star Wars: A New Hope"
    end
    
    it "properly inserts a new node as a right left child" do
      tree.insert(district)
      tree.insert(shawshank)
      tree.insert(martian)
      tree.insert(hope)
      tree.insert(empire)
      expect(root.right.left.title).to eq "Star Wars: The Empire Strikes Back"
    end
    
    it "properly inserts a new node as a right rigth child" do
      tree.insert(district)
      tree.insert(shawshank)
      tree.insert(martian)
      tree.insert(hope)
      tree.insert(empire)
      tree.insert(mad_max_2)
      expect(root.right.right.title).to eq "Mad Max 2: The Road Warrior"
    end
  end
  
  describe "@backbone array" do
    it "orders array by least to greatest rating value" do 
      tree.insert(district)
      tree.insert(shawshank)
      tree.insert(martian)
      tree.insert(hope)
      tree.insert(empire)
      tree.insert(mad_max_2)
      tree.insert(pacific_rim)
      expect(tree.backbone).to eq [nil, pacific_rim, root, district, shawshank, martian, hope, empire, mad_max_2]
    end
  end
  
  describe "find(title)" do
    it "returns the correct node when called" do
      tree.insert(empire)
      tree.insert(mad_max_2)
      tree.insert(pacific_rim)
      tree.insert(braveheart)
      tree.insert(jedi)
      tree.insert(donnie)
      tree.insert(inception)
      tree.insert(district)
      tree.insert(shawshank)
      tree.insert(martian)
      tree.insert(hope)
    
    
      expect(tree.find(tree.root, "The Matrix").title).to eq "The Matrix"
      expect(tree.find(tree.root, empire.title).title).to eq "Star Wars: The Empire Strikes Back"
      expect(tree.find(tree.root, mad_max_2.title).title).to eq "Mad Max 2: The Road Warrior"
      expect(tree.find(tree.root, pacific_rim.title).title).to eq "Pacific Rim"
      expect(tree.find(tree.root, braveheart.title).title).to eq "Braveheart"
      expect(tree.find(tree.root, jedi.title).title).to eq "Star Wars: Return of the Jedi"
      expect(tree.find(tree.root, donnie.title).title).to eq "Donnie Darko"
      expect(tree.find(tree.root, inception.title).title).to eq "Inception"
      expect(tree.find(tree.root, district.title).title).to eq "District 9"
      expect(tree.find(tree.root, shawshank.title).title).to eq "The Shawshank Redemption"
      expect(tree.find(tree.root, martian.title).title).to eq "The Martian"
      expect(tree.find(tree.root, hope.title).title).to eq "Star Wars: A New Hope"
    end
  end
  
  describe "delete(root, title)" do
    it "properly deletes items from heap"do
      tree.insert(empire)
      tree.insert(mad_max_2)
      tree.insert(pacific_rim)
      tree.insert(braveheart)
      tree.insert(jedi)
      tree.insert(donnie)
      tree.insert(inception)
      tree.insert(district)
      tree.insert(shawshank)
      tree.insert(martian)
      tree.insert(hope)
      
      expect(tree.find(tree.root, "The Matrix").title).to eq "The Matrix"
      expect(tree.find(tree.root, empire.title).title).to eq "Star Wars: The Empire Strikes Back"
      expect(tree.find(tree.root, mad_max_2.title).title).to eq "Mad Max 2: The Road Warrior"
      expect(tree.find(tree.root, pacific_rim.title).title).to eq "Pacific Rim"
      expect(tree.find(tree.root, braveheart.title).title).to eq "Braveheart"
      expect(tree.find(tree.root, jedi.title).title).to eq "Star Wars: Return of the Jedi"
      expect(tree.find(tree.root, donnie.title).title).to eq "Donnie Darko"
      expect(tree.find(tree.root, inception.title).title).to eq "Inception"
      expect(tree.find(tree.root, district.title).title).to eq "District 9"
      expect(tree.find(tree.root, shawshank.title).title).to eq "The Shawshank Redemption"
      expect(tree.find(tree.root, martian.title).title).to eq "The Martian"
      expect(tree.find(tree.root, hope.title).title).to eq "Star Wars: A New Hope"
      
      expect(tree.find(tree.root, empire.title).title).to eq "Star Wars: The Empire Strikes Back"
      tree.delete(tree.root, empire.title)
      expect(tree.find(tree.root, empire.title)).to eq nil
      
    end
  end
  
  describe "print" do
    specify {
      
       expected_output = "Pacific Rim: 72\nStar Wars: Return of the Jedi: 80\nThe Matrix: 87\nDistrict 9: 90\nStar Wars: A New Hope: 93\nMad Max 2: The Road Warrior: 98\n"
       tree.insert(hope)
       tree.insert(jedi)
       tree.insert(pacific_rim)
       tree.insert(district)
       tree.insert(mad_max_2)
       expect {tree.printf}.to output(expected_output).to_stdout
     }

  end
end

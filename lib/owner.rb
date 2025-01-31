require 'pry'

class Owner
  @pets = {fishes: [], dogs: [], cats: []}
  attr_accessor :pets, :name
  attr_reader :species
  @@all = []

  def initialize(species)
    @species = species
    @pets = {fishes: [], dogs: [], cats: []}
    @@all << self
  end 
  
  def self.all
    @@all
  end
  
  def self.count
    @@all.length
  end
  
  def self.reset_all
    @@all.clear
  end
  
  def say_species
    "I am a #{@species}."
  end
  
  def name=(name) 
    @name = name
  end

  def buy_fish(name)
    self.pets[:fishes] << Fish.new(name)
  end
  
  def buy_cat(name)
    self.pets[:cats] << Cat.new(name)
  end
  
  def buy_dog(name)
    self.pets[:dogs] << Dog.new(name)
  end
  
  def walk_dogs
    pets[:dogs].each {|dog| dog.mood = "happy"} 
  end
  
  def play_with_cats
    pets[:cats].each {|cat| cat.mood = "happy"}
  end
  
  def feed_fish
    pets[:fishes].each {|fish| fish.mood = "happy"}
  end
  
  def sell_pets
    pets.each do |type, petss|
      petss.each {|pet| pet.mood = "nervous"}
    end
    @pets.clear  
  end
  
  def list_pets
    "I have #{pets[:fishes].length} fish, #{pets[:dogs].length} dog(s), and #{pets[:cats].length} cat(s)."
  end  
  

end
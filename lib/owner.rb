require 'pry'

class Owner
  attr_accessor :name, :pets
  attr_reader :species

  @@owners = []

  def initialize(name)
    @@owners << self
    @name = name
    @species = 'human'
    @pets = { dogs: [], cats: [], fishes: [] }
  end

  def self.all
    @@owners
  end

  def self.reset_all
    @@owners = []
  end

  def self.count
    @@owners.size
  end

  def say_species
    "I am a #{self.species}."
  end

  def buy_cat(cat_name)
    @cat = Cat.new(cat_name)
    @pets[:cats] << @cat
  end

  def buy_dog(dog_name)
    @dog = Dog.new(dog_name)
    @pets[:dogs] << @dog
  end

  def buy_fish(fish_name)
    @fish = Fish.new(fish_name)
    @pets[:fishes] << @fish
  end

  def walk_dogs
    @pets[:dogs].each { |dog| dog.mood = 'happy' }
  end

  def play_with_cats
    @pets[:cats].each { |cat| cat.mood = 'happy' }
  end

  def feed_fish
    @pets[:fishes].each { |fish| fish.mood = 'happy' }
  end

  def sell_pets
    @pets.each { |species, pet_array|
      pet_array.each { |pet|
        pet.mood = 'nervous'
        }
      }
      @pets = { dogs: [], cats: [], fishes: [] }
  end

  def list_pets
      "I have #{@pets[:fishes].size} fish, #{@pets[:dogs].size} dog(s), and #{@pets[:cats].size} cat(s)."
  end
end

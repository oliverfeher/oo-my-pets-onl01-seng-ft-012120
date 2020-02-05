class Owner
  @@all = []

  attr_reader :name, :species, :mood

  def initialize(name, species = "human")
    @species = species
    @name = name
    @@all << self
  end
  
  def say_species
    p "I am a #{@species}."
  end

  def self.all
    @@all
  end

  def self.count
    return @@all.size
  end

  def self.reset_all
    return @@all.clear
  end

  def cats
    Cat.all.select {|cat| cat.owner == self}
  end

  def dogs
    Dog.all.select {|dog| dog.owner == self}
  end

   def buy_cat(cat)
    Cat.new(cat, self)
  end

  def buy_dog(dog)
    Dog.new(dog, self)
  end

  def walk_dogs
    dogs = Dog.all.select {|x| x.owner == self}
    dogs.each {|x| x.mood = "happy"}
  end

  def feed_cats
    cats = Cat.all.select {|x| x.owner == self}
    cats.each {|x| x.mood = "happy"}
  end

  def sell_pets
    dogs = Dog.all.select {|x| x.owner == self}
    cats = Cat.all.select {|x| x.owner == self}
    dogs.each {|x| x.owner = nil}
    cats.each {|x| x.owner = nil}
    cats.each {|x| x.mood = "nervous"}
    dogs.each {|x| x.mood = "nervous"}
  end

  def list_pets
    dogs = Dog.all.select {|x| x.owner == self}.size
    cats = Cat.all.select {|x| x.owner == self}.size
    return "I have #{dogs} dog(s), and #{cats} cat(s)."
  end
end


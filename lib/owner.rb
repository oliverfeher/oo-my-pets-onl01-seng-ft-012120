class Owner
    @@all = []
  
    attr_reader :name, :species
  
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
  
  end
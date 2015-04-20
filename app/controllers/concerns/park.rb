module Run
 
  attr_reader :run
  
  def initialize
    @run = false
  end
 
  def run
    @run = true
  end
 
  def is_running
    @run
  end
 
end
 
class Child
  include Run
 
  attr_reader :name , :age
  
  def initialize (name, age, call)
    @name = name
    @age = age
 
    run if call
  end
 
 
end
 
class Dog
 
  include Run
  attr_reader :name , :breed 
 
 
  def initialize (name, breed, call)
    @name = name
    @breed = breed
 
    run if call
  end
 
end
 
 
class Park
 
  attr_reader :dogs , :children
 
  def initialize
    reset
  end
 
  def add_dog (name, breed, call)
    dog = Dog.new(name, breed, call)
    dogs.push(dog)
  end
 
  def add_child (name, age, call)
    child = Child.new(name, age, call)
    children.push(child)
  end
 
  def all_dogs
 
    dogs.each do |dog|
      puts " #{dog.name} is a #{dog.breed}"
    end
  end
 
  def all_children
 
    children.each do |child|
      puts " #{child.name} is a #{child.age} years old"
    end
  end
 
  def who_is_running
 
    running = []
 
    dogs.each do |dog|
      puts " #{dog.name} the dog is running" if dog.is_running
    end
 
    children.each do |child|    
      puts " #{child.name} the child is running" if child.is_running
    end
  end
 
  def reset
    @dogs = []
    @children = []
  end
end
 
 
park = Park.new
 
park.add_dog('Bob', 'PitBull', true)
park.add_dog('Candy', 'Labrador', false)
park.add_dog('Floki', 'Poodle', true)
 
park.add_child('Jane', '5', false)
park.add_child('Carol', '8', false)
park.add_child('Amanda', '6', true)
park.add_child('Axel', '8', true)
 
puts "All children"
park.all_children
puts "All dogs"
park.all_dogs
puts "Who is running"
park.who_is_running
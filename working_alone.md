Objects working alone
===

So far we've looked at the following:
  - Creating a new instance of a class
  - Storing and passing attributes to the class instance
  - Making the attributes accessible for getting and setting
  - Adding methods for an instance of a class.

But how else might we work with and refer to the instance from within the class we've created?  Cue the class inception music!

When we write `my_car = Car.new` we can refer to the `Car` instance while _outside_ of the class by referring to the variable `my_car`.  We can call methods on `my_car` as well, as we've seen with the `print_details` method.  It follows that we should also want to be able to do the same from _within_ the object itself!  Everyone meet `self`, a keyword in Ruby that allows us to reference the instance object from within the object itself.  With `self` we can refer to the instance while _inside_ the object.  We can call methods on `self` too.

Reference the instance object?  What language is that?!  Well, let's look at what `self` _is_.  To get a look at the value of `self` we'll first create a method named `print_self` that justs prints the value of self to our terminal.

```ruby
# car.rb
class Car
  attr_accessor :brand, :model, :color, :doors

  def initialize(brand, model, color, doors)
    @brand = brand
    @model = model
    @color = color
    @doors = doors
  end

  # ... some other code here ...

  def print_self
    puts self
  end
end
```

```ruby
# main.rb
require_relative 'car'

space_car = Car.new('Corellian', 'YT-1300 Light Freighter', 'gray', 3)

puts space_car
# #<Car:0x0123456789abcdef>
# => nil

space_car.print_self
# #<Car:0x0123456789abcdef>
# => nil
```

So by looking at that silly object identifier `#<Car:0x0123456789abcdef>` we know they are the same car instance, just found in two different ways!  One is the reference to the `space_car` object that we created with `Car.new` and the other is the special variable Ruby has that allows an object to refer to itself, in this case our instance of `Car`.

As we can see, `self` is storing the same information as the variable we use when calling the `new` method on our `Car` class but is available to the object it.self.  It is storing the _instance_ of the class.  **Neato!**

## How can we use `self`?

Remember how we took printing to the terminal from main.rb and moved them into our class?  Given how `self` works for us, we can almost do a 1-to-1 implementation!

When using `self` like this, we need to insure that the `attr_accessor` is available since that is the magic behind our ability to do this.  It allows the use of the instance variables in this way with both `self` and any variables we create as an instance of the class.

```ruby
# car.rb
class Car
  attr_accessor :brand, :model, :color, :doors

  def initialize(brand, model, color, doors)
    @brand = brand
    @model = model
    @color = color
    @doors = doors
  end

  # ... other code here ...

  def print_details_with_self
    "This car is a #{self.brand} #{self.model}."
    "Its color is #{self.color}."
    "And it has #{self.doors} doors."
  end
end
```

Now let's see what Ruby says about `my_car`.

```ruby
# main.rb
require_relative 'car'

my_car = Car.new('Incom', 'T-65', 'orange/white', 1)

puts "-> using my_car"
puts "This car is a #{my_car.brand} #{my_car.model}."
puts "Its color is #{my_car.color}."
puts "And it has #{my_car.doors} doors."
# This car is a Incom T-65.
# Its color is orange/white.
# And it has 1 doors.

puts "-> using self.<attribute_name>"
my_car.print_details_with_self
# This car is a Incom T-65.
# Its color is orange/white.
# And it has 1 doors.
```

When using `self` in this way, to access attributes stored in instance variables, we _must_ add them to the `attr_accessor`!  If we forget to do this we'll get an error from either of the above examples(`my_car` or `self`).

## Without `self`

The `attr_accessor` is a helper method that allows us to _get_ and _set_ attribute values.  Those are pretty words, but what does this actually mean?

When we write `attr_accessor :brand`, Ruby knows that the instances of this class you've done this in will need the ability to both _Get_ the value of the brand attribute and to be able to _Set_ brand to something else later.  It does this by way of Ruby magic and takes care of the heavy lifting for us.

This is why we can use `my_car.doors` or `self.doors` to _get_ the number of doors on the car instance, and is also why we're able to _set_ a new color for the instance with `my_car.color = 'purple'` or `self.color = 'purple'`.

But we can go deeper!  Because of the way Ruby uses these `attr_accessors`, we can use them to do the following:

```ruby
# car.rb
class Car
  attr_accessor :brand, :model, :color, :doors

  # ... code here ...

  def print_details_with_instance_variables
    puts "This car is a #{@brand} #{@model}."
    puts "Its color is #{@color}."
    puts "And it has #{@doors} doors."
  end

  def print_details_without_self
    puts "This car is a #{brand} #{model}."
    puts "Its color is #{color}."
    puts "And it has #{doors} doors."
  end
end
```

```ruby
# main.rb
require_relative 'car'

my_car = Car.new('Suzuki', 'Alto', 'red', 4)

puts '-> with @instance_variables'
my_car.print_details_with_instance_variables
# This car is a Suzuki Alto.
# Its color is red.
# And it has 4 doors.

puts '-> without self'
my_car.print_details_without_self
# This car is a Suzuki Alto.
# Its color is red.
# And it has 4 doors.
```

As long as we have declared the `attr_accessor` for instance variables, we can use just the attribute name when _Getting_ a variable from within the instance methods.  The first thing Ruby does when you use a possible method or variable name is check to see if something of the same name belongs to `self`.  This is why we can use just the attribute name.

## Setting values

However, we do still need to use `self.attribute = 'new_value'` to _set_ the `@instance variable` to another value.  If we forget to add `self` in front then it won't update the instance variable.  Instead it will just be a normal local variable in the method that vanishes when the method goes out of scope!

```ruby
# thing.rb
class Thing
  attr_accessor :color

  def initialize(color)
    @color = color
  end

  def print_color
    puts "This thing is #{color}."
  end

  def set_color(new_color)
    # @color = new_color
    self.color = new_color
  end

  def just_a_variable(new_color)
    color = new_color
  end
end
```

```ruby
# main.rb
require_relative 'thing'

my_thing = Thing.new('blue')
my_thing.print_color
# This thing is blue.

puts '-> color'
my_thing.just_a_variable('purple')
my_thing.print_color
# This thing is blue.

puts '-> self.color'
my_thing.set_color('purple')
my_thing.print_color
# This thing is purple.
```

Without _self_ in front of the attribute name during assignment, Ruby will only create a local variable!

## Methods!

How does this all translate?  Well, since `self` is referring to the instance of the object, our car in the case, it means we can also use `self.method_name` for methods we create.  Have a look at this!

```ruby
# car.rb
class Car
  # ... other code here ...

  def print_with_print_methods
    puts '-> with self'
    self.print_details_with_attributes
    puts '-> without self'
    print_details_with_attributes
  end
end
```

```ruby
# main.rb
this_car = Car.new('Ford', 'Fiesta', 'green', 2)

this_car.print_with_print_methods
```

The final point is that we can use both `self.method_name` and `method_name` for Getting instance variables or calling methods on an object because they are, you guessed it, the same!  When you just put something Ruby knows isn't built in, it will first say "I should see if `self` knows about this guy", so both end up doing the same thing.  The first is explicitly showing the behaviour, but Ruby is smart enough to check for us; except when _Setting_ an attribute to a new value.

---
>Exercise 1:
 Build your Space Ship.

  Create a `SpaceShip` class inside a file named `space_ship.rb` that has two attributes: `name` and `color`.

  Ensure there is a method to `print_details` of the ship for us and don't forget our friend that makes this all possible!  Use `self` to for the various attributes you're printing information on.

  While you're at it, add a method for a `SpaceShip` instance which allows it to receive a new coat of `paint` and change its color without using the instance variable.

  Print the ship details through `main.rb`, change the color, and print them again to make sure the paint has dried!

---
>Exercise 2:
 Scale up your Crew.

  Your `SpaceShip` is a bit empty, isn't it?  What point is there for a ship if there's no one aboard.  Time to implement a `CrewMember` class in a `crew_member.rb` file.  Each crew member should have `rank` and `name` instance variables.

  As we are an autonomous crew, we don't need any `attr_accessor`!  Instead we'll write own own methods to mimic the behaviour.

  First, write a method called `name` to __get__ the value for a `CrewMember` instance's name.

  Now we have some real officer material aboard, so we're also going to need a `promote` method.  This will allow an instance of `CrewMember` to be promoted and __set__ its rank to 'Captain'.

---
>Exercise 3:
 Time to Crew your Ship!

  Well now, we have both `SpaceShip` and `CrewMember` ready to go. Now we need to put the two together or we'll never get off the ground!

  Ensign, your job is to  add a `crew_members` instance variable to your `SpaceShip`.  Since it will be holding several individuals, we'll want to initialize the `crew_members` as an empty array.

  Your `SpaceShip` instance will need to be able to `add_crew_members` after it has been created.  It should be able to take an instance of `CrewMember` and add it to the array of `crew_members`.

  Think about why me might want to store one object inside another, and maybe take a few moments to draw it out on paper to help you visualise it.

  You will now want to adapt the `print_details` method so that it prints the name of each `crew_member` when you use it.

  Use `main.rb` to take create two `SpaceShip` instances and four `CrewMember` instances.  Add two crewmembers to each ship and print the details for both of the space ships!

---

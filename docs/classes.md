# Classes
classes are defined like this:
```
class ClassName:
    # [...]
end
```
a more advanced example using methods is seen below:
```
class Pet:
    name = "Rover"
    age = 7
    type = "Dog"

    fn changeAge(newAge: Integer) -> Integer:
        val this.age = newAge
    end

    fn makeNoise():
        switch(type):
            "Dog" -> print("Woof")
            "Cat" -> print("Meow")
            else -> print("*silence*")
        end
    end
end
```
you can create an instance of the class by calling it like a function
```
fn main():
    animal! = Pet()
    print(animal.age) # => 7
    animal.changeAge(8)
    print(animal.age) # => 8
    animal.makeNoise() # => "Woof"
end
```
classes can have constructors like this:
```
class Vector:
    x = 0
    y = 0

    fn Vector: # constructor
        val this.x = x
        val this.y = y
    end

    fn add(addX, addY):
        val this.x = this.x + addX
        val this.y = this.y + addY
    end
end

fn main:
    v1 = Vector(1, 2)
    v2 = Vector(3, 4)
    v1.add(v2.x, v2.y)
    print(v1) # => Vector(4, 6)
end
```
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
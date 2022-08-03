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
    var name = "Rover"
    var age = 7
    var type = "Dog"

    fn changeAge(newAge: Integer) -> Integer:
        this.age = newAge
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
    let animal = Pet()
    print(animal.age) # => 7
    animal.changeAge(8)
    print(animal.age) # => 8
    animal.makeNoise() # => "Woof"
end
```
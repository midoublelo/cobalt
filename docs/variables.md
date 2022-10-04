# Variables
in cobalt variables are declared like this:
```
x = 5
y = 10
print(x + y) # => 15
```
variables are mutable and the value can be changed with the 'val' keyword
```
z = 7
print(z) # => 7
val z = 3
print(z) # => 3
```
to make an immutable variable you can add an ! to the variable name
```
a! = 1
print(a) # => 1
val a! = 2 # => Error: cannot change value of immutable variable
```
cobalt has type inference so you do not need to declare the type of the variable but you can if you want
```
int b = 5
val b = "cake" # => Error: cannot change type of b
```
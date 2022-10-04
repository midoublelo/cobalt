# Functions
functions are created like this:
```
fn main:
    # [...]
end
```
parentheses are not necessary if the function has no parameters
you can add a return type to the function like this:
```
fn greeting -> string:
    "Hello"
    # functions automatically return their last expression but you can return early using the 'return' keyword
end
```
you can add parameters to the function like this:
```
fn addNums(int a, int b) -> int:
    a + b
end
```
functions are called like this:
```
addNums(2, 2) # => 4
```

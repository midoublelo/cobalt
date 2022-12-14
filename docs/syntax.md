# Syntax
- cobalt files are stored in text files with a `.co` file extension
- the executed file needs a `main` function which acts as the start point of the program
## Comments
single line comments are done as follows:
```
# this is a single line comment
```
multi line comments are done as follows:
```
/* This
is
a
multi
line
comment */
```
## Keywords
the following words are reserved by cobalt:
```
class fn end val while if for return using else nil false true this from
```
## Naming Conventions
cobalt does not enforce any naming conventions but strongly recommends `PascalCase` for class names and `camelCase` for everything else
## Newlines
newlines are used to seperate statements when they aren't placed in front of a token that cannot end a statement as seen here:
```
hello( # this newline is ignored
    "World!")
```
## Blocks
cobalt is actually a curly braces lang, they are just disguised. a `:` replaces `{` and the `end` keyword replaces `}`. syntactically looks nicer but semantically works the same way so indentation is not important. these two are functionally the same:
```
{
    # this is a block
}

:
    # this is also a block
end
```
this example makes it look bad but trust me it works in practice
## Symbols and Keywords
cobalt has the pipe operator which is used for function composition
```
fn sum(a, b):
    a + b;
end

fn multiply(a, b):
    a * b;
end

fn divide(a, b):
    a / b;
end

sum(2, 3) |> multiply(3) |> divide(5); # => 3
divide(multiply(sum(2, 3), 3), 5); # => 3
```
They return the same value but using the pipe operator makes the code more readable and understandable

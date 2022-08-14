# Syntax
cobalt files are stored in text files with a `.co` file extension
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
keywords
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
# Collections
- collections are compound types that can contain multiple elements in them
- they are zero-indexed
- main types of collections are: lists, arrays and maps

## Lists
lists are created like this:
```
list1 = ["Smith", 2.2, False]
```
- lists are mutable and, by default, can contain any type
- existing elements in the list can be reassigned
- elements can be added to and removed from the list at any time

lists can be given a specific type like this:
```
intList: Integer = [5, 9, 233]
strList: String = ["Hello", "World"]
```
- typed lists are still mutable
- its length can be extended or shortened at any time
## Arrays
arrays are created like this:
```
array1! = ["Smith", 2.2, False]
```
- arrays are immutable and their length can't change
- they can still contain any type
- they function the same way as lists apart from being immutable

arrays can be given a specific type like this:
```
intList!: Integer = [5, 9, 233]
strList!: String = ["Hello", "World"]
```
## Maps
maps are created like this:
```
capitals = {
    "United Kingdom": "London",
    "Japan": "Tokyo",
    "Ethiopia": "Addis Ababa"
}
```
- this data structure is sometimes referred to as a hash, dictionary, etc. in other languages
- consists of a key mapped to a value
- maps are mutable but can be made immutable by adding an exclamation mark to the variable name
## Create and Use Lists

This module is intended to give you more experience in working with lists.
You are expected to test your implementations. 

For this module you will complete the following exercises:

(Exercises are borrowed from Functional Programming in OCaml (Spring 2019 Edition))

### Exercise: list expressions [✭]

- construct a list that has the integers `1` through `5` in it. Use the square bracket notation for lists.
- construct the same list, but do not use the square bracket notation. Instead use `::` and `[]`.
- construct the same list again. This time, the following expression must appear in your answer: `[2;3;4]`. Use the `@` operator, and do not use `::`.

### Exercise: patterns [✭✭✭]

Using pattern matching, write three functions, one for each of the following properties. Your functions should return true if the input list has the property and false otherwise.

- the list's first element is "brown"
- the list has exactly two or four elements; do not use the length function
- the first two elements of the list are equal


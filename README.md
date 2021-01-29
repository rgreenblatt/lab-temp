# Lab 1: Introduction to OCaml

This lab covers the following topics and is meant to help you familiarize yourself with the OCaml language and its various features you are expected utilize throughout the semester. Each module has a `demo.ml` file that you can follow along during the lecture part of the lab and an `exercises.ml` file that you are expected to implement. For the most part, we provide some basic test cases for you to test your code but you should think of further edge cases and test your code accordingly.

## Content

1. Lists Module: Creating and using lists ([./list](./list))
   1. `[]` and `(::)`
   2. pattern matching lists (demonstrate `_` , exhaustiveness and unused branches ) 
   3. More syntaxes for list construction (e.g. `[e]` and `[e;e]` and `[e;e;e]` )
   4. List appending ( `(@)` )

2. Recursive Functions: Defining recursive functions ([./recursive_functions](./recursive_functions))

   1. defining some recursive functions on lists (e.g. `length` , `sum` , `product` ) 
   2. (maybe) Mutual recursion ( `let rec … and … in …` )
   3. Helper functions that use accumulators ( `product` , `fib_fast` , concatenating binary tree nodes)
   4. Demonstrate #trace
   5. Show different ways to call a function (e.g. `(f x y)` and `((f x) y)` )

3. More Functions: Understanding and reading higher-order and polymorphic functions ([./more_functions](./more_functions)):

   1. introduction to lambdas ( `fun`; `function` as a shorthand for `fun` and `match` ) 
   2. using `List.map` , `List.mapi` , `List.concat` (and `(@)` ), `List.concat_map` , `List.fold_left` , (maybe) `List.fold_right`
   3. during this section we would go through the official documentation/VSCode hints (autocomplete and mouse hover) with the students and show how to read polymorphic function signatures, however students will not be required to write their own polymorphic function during this lab 

4. Testing: Unit testing with OUnit2 ([./testing](./testing))
5. Tuples, Records & ADTs: Creating and using tuples and records and defining new algebraic data type. (also mention the distinction between tuples and lists) ([./tuples_records_and_adts](./tuples_records_and_adts))
7. Options And Exceptions: Creating and using options and exceptions ([./option_and_exception](./option_and_exception))
8. Some pitfalls:
    - `=` vs `==`
    - `f x y` vs `f(x,y)`
    - `^` is string concat
    - rebinding is shadowing instead of mutation

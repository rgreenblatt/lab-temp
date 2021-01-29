## More Functions 

In this module you will explore lamdas, higher order functions 
You are expected test your implementations. 

For this module you will complete the following exercises:

(Some of the exercises are borrowed from Functional Programming in OCaml (Spring 2019 Edition))

### Exercise: Compose [✭]

Write a function `compose` that takes in two unary functions and composes them `f o g`

### Exercise: Power of Fold [✭✭]

Use `fold_left` or `fold_right` to implement your own `map`, `length`, `filter` and `rev` functions 

### Exercise: map composition [✭✭✭]

Show how to replace any expression of the form `List.map f (List.map g lst)` with an equivalent expression that calls `List.map` only once.

### Exercise: twice, no arguments [✭]

Consider the following definitions:

```ocaml
let double x = 2*x
let square x = x*x
let twice f x = f (f x)
let quad = twice double
let fourth = twice square
```

Use the toplevel to determine what the types of quad and fourth are. Explain how it can be that quad is not syntactically written as a function that takes an argument, and yet its type shows that it is in fact a function.

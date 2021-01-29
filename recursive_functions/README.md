## Recursive Functions 

This module is intended to give you more experience in defining and working with recursive functions
You are expected test your implementations. 

For this module you will complete the following exercises:

(Exercises are borrowed from Functional Programming in OCaml (Spring 2019 Edition))

### Exercise: Sum [✭]

Define the function `sum` that takes in a list of integers and returns the sum

### Exercise: Sum Tail Recursive [✭]

Try implementing the same function using tail recursion 

### Exercise: takeWhile [✭]

Define the function `takeWhile` that takes in a list of integers, a predicate function `f` and collects the elements until an element that doesn't satify the predicate is reached

For example given `[1, 2, 3 , 4, 5, 3, 2]` and f `fun a -> a < 4`, this function would return `[1, 2, 3]` 

### Exercise: fib fast [✭✭✭]

How quickly does your implementation of fib compute the 50th Fibonacci number? If it computes nearly instantaneously, congratulations! But the recursive solution most people come up with at first will seem to hang indefinitely. The problem is that the obvious solution computes subproblems repeatedly. For example, computing fib 5 requires computing both fib 3 and fib 4, and if those are computed separately, a lot of work (an exponential amount, in fact) is being redone.

Create a function fib_fast that requires only a linear amount of work. Hint: write a recursive helper function h : int -> int -> int -> int, where h n pp p is defined as follows:

    h 1 pp p = p, and

    h n pp p = h (n-1) p (pp+p) for any n > 1.

The idea of h is that it assumes the previous two Fibonacci numbers were pp and p, then computes forward n more numbers. Hence, fib n = h n 0 1 for any n > 0.

What is the first value of n for which fib_fast n is negative, indicating that integer overflow occurred?

### Exercise: Function Associativity [✭✭]

Which of the following produces an integer, which produces a function, and which produces an error? Decide on an answer, then check your answer in the toplevel.

    add 5 1
    add 5
    (add 5) 1
    add (5 1)

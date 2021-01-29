(* Exercise: Sum *)
let rec sum (l : int list) : int =
  match l with [] -> 0 | x :: xs -> x + sum xs

(* Exercise: Sum Tail Recursive *)
let rec sum_tail_impl (l : int list) (acc : int) : int =
  match l with [] -> acc | x :: xs -> sum_tail_impl xs (acc + x)

let sum_tail (l : int list) : int = sum_tail_impl l 0

(* Exercise: takeWhile*)
let rec takeWhile (f : int -> bool) (l : int list) =
  match l with [] -> [] | x :: xs -> if f x then x :: takeWhile f xs else []

(*Exercise: Fib Fast: TODO*)
let rec fib_fast_impl v n last before_last =
  if v > n then last else fib_fast_impl (v + 1) n (last + before_last) last

let fib_fast n = if n == 0 then 0 else fib_fast_impl 2 n 1 0

(*Exercise: Function Associativity *)
let add (a : int) (b : int) : int = a + b

let e1 = add 5 1

let e2 = add 5

let e3 = (add 5) 1

let e4 = add 5 1

(* Exercise: construct a list that has the integers 1 through 5 in it. Use the square bracket notation for lists. *)
let l1 : int list = []

(* Exercise: construct the same list, but do not use the square bracket notation. Instead use :: and []. *)
(* Note that ocamlformat may rewrite this expression to use the square bracket notation. That is acceptable and won't prevent you from getting checked off. 
  This exercise is to get familiar with this notation which you will utilize to deconstruct lists in the later modules *) 
let l2 : int list = []

(* Exercise: construct the same list again. This time, the following expression must appear in your answer: [2;3;4]. Use the @ operator, and do not use ::. *)
let l3 : int list = []

(* When you are ready, [cd] to [lab0/list] and run [dune test] *)

(* Exercise: patterns [✭✭✭] *)

let starting_with_brown lst =
    match lst with
    | _ -> false
let two_or_four lst =
    match lst with
    | _ -> false
let first_two_equal lst =
    match lst with
    | _ -> false

(* We will write more list functions in the next section. *)

(* Lambdas *)
(*
   The syntax for lambdas is `fun args... -> body`. You can define these inline
   and pass it to any higher order function
*)
let lam = fun x -> x + 1

(* Higher Order Functions *)

let double x = 2 * x
let square x = x * x

let quad x   = double (double x)
let fourth x = square (square x)

(* Notice the similarities between quad and fourth. Let's try to abstract the common structure *)
let twice f x = f (f x)
let quad   x = twice double x
let fourth x = twice square x

(* Map, Filter, Fold *)
let example_list = [1, 2, 3]
let add1 (x: int) = x + 1 
let example_list2 = List.map add1 example_list

(* Rewrite using a lambda *)
let example_list2 = List.map (fun x -> x + 1) example_list

let filtered_list = List.filter (fun x -> x > 1) example_list

let rec sum' init = function
  | [] -> init
  | h::t -> h + sum' init t

let sum = sum' 0

let rec concat' init = function
  | [] -> init
  | h::t -> h + concat' init t

(* Notice the similarities between concat and sum *)
let sum    = List.fold_left (+) 0  
let concat = List.fold_left (^) ""

(* Currying *)
let add x y = x + y
let add' t = (fst t) + (snd t)
let add'' (x,y) = x + y
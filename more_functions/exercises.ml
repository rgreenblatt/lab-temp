(* Exercise: Compose*)
let compose f g x = f (g x)

(* Exercise: Power of Fold *)

(* Function length takes in a list and returns it's length*)
let length l = List.fold_left (fun v _ -> v + 1) 0 l

(* Function rev reverses a given list *)
let rev l = List.fold_left (fun xs x -> x :: xs) [] l

(* Map takes in a function f, list l and applies f to each element in l*)
let map f l = List.fold_right (fun x xs -> f x :: xs) l []

(* Filter removes the elements that doesn't safisy the given precidate f*)
let filter f l = List.fold_right (fun x xs -> if f x then x :: xs else xs) l []

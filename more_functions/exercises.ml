(* Exercise: Compose*)
let compose f g x= f (g x)

(* Exercise: Power of Fold *)

(* Function length takes in a list and returns it's length*)
let length l = List.length l

(* Function rev reverses a given list *)
let rev l = List.rev l

(* Map takes in a function f, list l and applies f to each element in l*)
let map f l = List.map f l

(* Filter removes the elements that doesn't safisy the given precidate f*)
let filter f l = List.filter f l

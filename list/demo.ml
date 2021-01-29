(* 1. List construction and elimination: *)

(* [[]] construct an empty list  *)
let list1 : int list = []

(* [e :: es] construct a non-empty list, where [e] is the first element and [es] are the remaining. *)
let list2 : int list = 42 :: []

(* We can construct longer lists with [[]] and [(::)]. *)
let list3 : string list = "Welcome" :: "to" :: "CS1260" :: []

(* But there is a shorthand. *)
let list4 : string list = [ "Welcome"; "to"; "CS1260" ]

(* The function [(@)] concatenate two lists, for examples: *)

let _ = assert ([ 2; 3 ] = [ 2 ] @ [ 3 ])
let _ = assert ([ 2; 3 ] = [ 2 ] @ [] @ [ 3 ])

(* The assert function ensures that the two lists are the same [(=)]. *)

(* We have seen how to construct lists. It is time to destruct them! *)
(* [match] performs a case analysis on lists. The two cases correspond to two list constructors ([[]] and [(::)]). *)

let empty lst = 
  match lst with
  | [] -> true
  | _ :: _ -> false

let _ = assert (empty [])
let _ = assert (not (empty [2; 3]))

let head lst = 
  match lst with
  | [] -> raise (Failure "lst is empty")
  | h :: _ -> h

let tail lst = 
  match lst with
  | [] -> raise (Failure "lst is empty")
  | _ :: t -> t

let _ = assert (head ["a"; "b"; "c"] = "a")
let _ = assert (tail ["a"; "b"; "c"] = ["b"; "c"])

(* OCaml's pattern matching system is very powerful and intuitive. *)
let the_second_is_zero lst =
    match lst with
    | _ :: 0 :: _ -> true
    | _ -> false

let contains_three lst =
    match lst with
    | [_; _; _] -> true
    | _ -> false
(** We Define the following variants for pokemon types *)
type ptype = TNormal | TFire | TWater

(* A Record representing a pokemon *)
type mon = { name : string; hp : int; ptype : ptype }

let c = { name = "Charmander"; hp = 39; ptype = TFire }

(* Deconstructing records using pattern matching *)
let rec poke_names_recur (acc : string list) = function
  | [] -> acc
  | p :: rest -> (
      match p with
      | { name = n; hp = _; ptype = _ } -> poke_names_recur (n :: acc) rest)

let poke_names_map (l : mon list) = List.map (fun m -> m.name) l

(* A tuple is another kind of type in OCaml that programmers can define. Like records, it is a composite of other types of data. But instead of naming the components, they are identified by position. Here are some examples of tuples: *)

let (_ : int * int * int) = (1, 2, 10)

let (_ : int * int * int) = (1, 2, 10)

let (_ : bool * string) = (true, "Hello")

let (_ : int list * (float * char)) = ([ 1; 2; 3 ], (0.5, 'X'))

(* Building of tuples is easy: just write the tuple, as above. Accessing again involves pattern matching, for example: *)

let _ =
  let x, y, z = (1, 2, 3) in
  x + y + z

(* Alternatively *)

let _ = match (1, 2, 3) with x, y, z -> x + y + z

(* Tuples are most frequently used in data type definition ([type]), for example: *)

type 'a mylist = Empty | ( :: ) of 'a * 'a mylist

let rec contains l i =
  match l with Empty -> false | x :: xs -> x = i || contains xs i

(* Option and Exception *)

(* Based on
    https://www.cs.cornell.edu/courses/cs3110/2019sp/textbook/data/options.html
    and 
    https://www.cs.cornell.edu/courses/cs3110/2019sp/textbook/data/exceptions.html *)

let rec list_max = function
  | [] ->
      raise (Failure "todo")
  | h :: t ->
      max h (list_max t)

(* 
There are a couple possibilities to consider:
- Return min_int. But then list_max will only work for integers — not floats or other types.
- In Java, you might return null. OCaml does not have a null value. Which is actually a good thing: null pointer bugs are not fun to debug.
- Raise an exception. But then the user of the function has to remember to catch the exception.
- In addition to those possibilities, OCaml provides something even better called an option. (Haskellers will recognize options as the Maybe monad.)
 *)

let (_ : int option) = Some 42

let (_ : int option) = None

let extract o = match o with Some i -> string_of_int i | None -> ""

let _ = assert (extract (Some 42) = "42")

let _ = assert (extract None = "")

let rec list_max_opt = function
  | [] ->
      None
  | h :: t -> (
    match list_max_opt t with None -> Some h | Some m -> Some (max h m) )

exception Max_undefined

let rec list_max_exn = function
  | [] ->
      raise Max_undefined
  | h :: t -> (
    match list_max_exn t with m -> max h m | exception Max_undefined -> h )

(* Exceptions are convenient when they are truely exceptional. For example,
when you know [list_max] is only applied to non-empty lists. *)

let (_ : int list) = List.map list_max_exn [[1; 2; 3]; [42]; [4; 5]]

(* Exceptions forget all computation between the raise and the nearest catching [match].
 This behavior is sometimes useful. *)

exception Found_zero

let rec product_helper = function
  | [] ->
      1
  | 0 :: _ ->
      raise Found_zero
  | n :: ns ->
      n * product_helper ns

(* 
product_helper [1; 2; 0; 3]
= 1 * product_helper [2; 0; 3]
= 1 * 2 * product_helper [0; 3]
= 1 * 2 * raise Found_zero
raise Found_zero
 *)

let product ns =
  match product_helper ns with n -> n | exception Found_zero -> 0

(* But this behavior might stop your code unexpectedly. *)

let _ =
  match List.map list_max_exn [[]; [1; 2; 3]; [42]; [4; 5]] with
  | _ ->
      ()
  | exception Max_undefined ->
      ignore "Bad thing happened"

let (_ : int option list) = List.map list_max_opt [[]; [1; 2; 3]; [42]; [4; 5]]

(* Usually [option]s are safer to use because they remind us that there is a special case. *)
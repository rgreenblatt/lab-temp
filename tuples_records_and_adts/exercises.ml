open Demo

(* let todo = failwith "unimplemented" *)

(* Exercise: Languages *)
(* Your Implementation Goes Here *)
type languages = {name: string; compiled: bool; target: string option}

(* Exercise: Map and Fold_left *)
let rec map f mylist =
  match mylist with Empty -> Empty | x :: xs -> f x :: map f xs

let rec foldl (f : 'a -> 'b -> 'a) (x : 'a) (l : 'b mylist) =
  match l with Empty -> x | y :: ys -> foldl f (f x y) ys

(* Exercise: Custom Trees *)

type 'a tree = Leaf | Node of 'a * 'a tree * 'a tree

let rec collapse = function
  | Leaf ->
      []
  | Node (v, l, r) ->
      [v] @ collapse l @ collapse r

(* Exercise: Sentence to Tree *)
let rec add_to_tree (s : 'a) (tree : 'a tree) =
  match tree with
  | Leaf ->
      Node (s, Leaf, Leaf)
  | Node (v, l, r) ->
      if s < v then Node (v, add_to_tree s l, r)
      else Node (v, l, add_to_tree s r)

let rec lst_to_tree = function
  | [] ->
      Leaf
  | x :: xs ->
      add_to_tree x (lst_to_tree xs)

(* Exercise: Depth *)
let rec depth = function
  | Leaf ->
      0
  | Node (_, l, r) ->
      1 + max (depth l) (depth r)

(* Exercise: Is BST? *)
let op_check f op = match op with None -> true | Some v -> f v

let rec is_bst_impl : 'a tree -> bool * 'a option = function
  | Leaf ->
      (true, None)
  | Node (v, l, r) ->
      let l_is_bst, l_v = is_bst_impl l in
      let r_is_bst, r_v = is_bst_impl r in
      ( l_is_bst && r_is_bst && op_check (( > ) v) l_v && op_check (( < ) v) r_v
      , Some v )

let is_bst (t : int tree) = match is_bst_impl t with v, _ -> v

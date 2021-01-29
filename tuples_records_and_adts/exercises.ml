open Demo

(* let todo = failwith "unimplemented" *)

(* Exercise: Languages *)
(* Your Implementation Goes Here *)

(* Exercise: Map and Fold_left *)
let rec map f mylist =
  match mylist with Empty -> Empty | x :: xs -> f x :: map f xs

let rec foldl (f : 'a -> 'b -> 'a) (x : 'a) (l : 'b mylist) =
  match l with Empty -> x | y :: ys -> foldl f (f x y) ys

(* Exercise: Custom Trees *)

type 'a tree = TEmpty | Leaf of 'a | Node of 'a * 'a tree * 'a tree

(* Exercise: Sentence to Tree *)
(* let sentence_to_tree (s : string list) = todo *)

(* (1* Exercise: Traverse & Collapse *1) *)
(* let tree_traverse = todo *)

(* Exercise: Depth *)
let rec depth = function
  | TEmpty ->
      0
  | Leaf _ ->
      1
  | Node (_, l, r) ->
      1 + max (depth l) (depth r)

(* Exercise: Is BST? *)
let op_check f op = match op with None -> true | Some v -> f v

let rec is_bst_impl : int tree -> bool * int option = function
  | TEmpty ->
      (true, None)
  | Leaf v ->
      (true, Some v)
  | Node (v, l, r) ->
      let l_is_bst, l_v = is_bst_impl l in
      let r_is_bst, r_v = is_bst_impl r in
      ( l_is_bst && r_is_bst && op_check (( > ) v) l_v && op_check (( < ) v) r_v
      , Some v )

let is_bst (t : int tree) = match is_bst_impl t with v, _ -> v

let v : bool = is_bst TEmpty

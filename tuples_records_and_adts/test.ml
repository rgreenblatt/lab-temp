(** You are expected to write your own tests for this module **)

open OUnit2
open Exercises
open Demo

let string_of_int_list l =
  "[ " ^ String.concat "; " (List.map string_of_int l) ^ " ]"

let assert_int_list_equal l1 l2 = assert_equal ~printer:string_of_int_list l1 l2

let test_map =
  "test_map"
  >::: [ ("map_empty" >:: fun _ -> assert_equal Empty (map (fun a -> a) Empty))
       ; ( "map_single"
         >:: fun _ -> assert_equal (2 :: Empty) (map (( + ) 5) (-3 :: Empty)) )
       ; ( "map_few"
         >:: fun _ ->
         assert_equal (8 :: -2 :: 2 :: Empty)
           (map (( + ) 5) (3 :: -7 :: -3 :: Empty)) ) ]

let test_foldl =
  "test_foldl"
  >::: [ ("foldl_empty" >:: fun _ -> assert_equal 2 (foldl ( + ) 2 Empty))
       ; ( "foldl_single"
         >:: fun _ -> assert_equal 5 (foldl ( + ) 2 (3 :: Empty)) )
       ; ( "foldl_few"
         >:: fun _ -> assert_equal 1 (foldl ( + ) (-8) (2 :: 8 :: -1 :: Empty))
         ) ]

let test_depth =
  "test_depth"
  >::: [ ("depth_empty" >:: fun _ -> assert_equal 0 (depth TEmpty))
       ; ("depth_leaf" >:: fun _ -> assert_equal 1 (depth (Leaf 0)))
       ; ( "depth_node"
         >:: fun _ -> assert_equal 2 (depth (Node (0, TEmpty, TEmpty))) )
       ; ( "depth_large"
         >:: fun _ ->
         assert_equal 3 (depth (Node (5, Leaf 3, Node (9, Leaf 8, Leaf 10)))) )
       ; ( "depth_left"
         >:: fun _ ->
         assert_equal 3 (depth (Node (5, Node (9, Leaf 8, Leaf 10), Leaf 3))) )
       ]

let test_is_bst =
  "test_is_bst"
  >::: [ ("is_bst_empty" >:: fun _ -> assert_bool "" (is_bst TEmpty))
       ; ("is_bst_leaf" >:: fun _ -> assert_bool "" (is_bst (Leaf 0)))
       ; ( "is_bst_node"
         >:: fun _ -> assert_bool "" (is_bst (Node (0, TEmpty, TEmpty))) )
       ; ( "is_bst_large"
         >:: fun _ ->
         assert_bool "" (is_bst (Node (5, Leaf 3, Node (9, Leaf 8, Leaf 10))))
         )
       ; ( "is_bst_wrong_ordering_few_left"
         >:: fun _ -> assert_bool "" (not (is_bst (Node (5, Leaf 7, Leaf 8))))
         )
       ; ( "is_bst_wrong_ordering_few_right"
         >:: fun _ -> assert_bool "" (not (is_bst (Node (5, Leaf 3, Leaf 4))))
         )
       ; ( "is_bst_wrong_ordering_few_left_equal"
         >:: fun _ -> assert_bool "" (not (is_bst (Node (5, Leaf 5, Leaf 8))))
         )
       ; ( "is_bst_wrong_ordering_few_right_equal"
         >:: fun _ -> assert_bool "" (not (is_bst (Node (5, Leaf 3, Leaf 5))))
         )
       ; ( "is_bst_wrong_ordering_many_left"
         >:: fun _ ->
         assert_bool ""
           (not (is_bst (Node (5, Leaf 3, Node (9, Leaf 8, Leaf 9))))) )
       ; ( "is_bst_wrong_ordering_many_right"
         >:: fun _ ->
         assert_bool ""
           (not (is_bst (Node (5, Leaf 3, Node (9, Leaf 9, Leaf 10))))) ) ]

let suite = "suite" >::: [test_map; test_foldl; test_is_bst]

let () = run_test_tt_main suite

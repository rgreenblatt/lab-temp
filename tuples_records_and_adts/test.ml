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
  >::: [ ("depth_empty" >:: fun _ -> assert_equal 0 (depth Leaf))
       ; ( "depth_leaf"
         >:: fun _ -> assert_equal 1 (depth (Node (0, Leaf, Leaf))) )
       ; ( "depth_node"
         >:: fun _ -> assert_equal 2 (depth (Node (0, Leaf, Leaf))) )
       ; ( "depth_large"
         >:: fun _ ->
         assert_equal 3
           (depth
              (Node
                 ( 5
                 , Node (3, Leaf, Leaf)
                 , Node (9, Node (8, Leaf, Leaf), Node (10, Leaf, Leaf)) ) ) )
         )
       ; ( "depth_left"
         >:: fun _ ->
         assert_equal 3
           (depth
              (Node
                 ( 5
                 , Node (9, Node (8, Leaf, Leaf), Node (10, Leaf, Leaf))
                 , Node (3, Leaf, Leaf) ) ) ) ) ]

let test_is_bst =
  "test_is_bst"
  >::: [ ("is_bst_empty" >:: fun _ -> assert_bool "" (is_bst Leaf))
       ; ( "is_bst_leaf"
         >:: fun _ -> assert_bool "" (is_bst (Node (0, Leaf, Leaf))) )
       ; ( "is_bst_node"
         >:: fun _ -> assert_bool "" (is_bst (Node (0, Leaf, Leaf))) )
       ; ( "is_bst_large"
         >:: fun _ ->
         assert_bool ""
           (is_bst
              (Node
                 ( 5
                 , Node (3, Leaf, Leaf)
                 , Node (9, Node (8, Leaf, Leaf), Node (10, Leaf, Leaf)) ) ) )
         )
       ; ( "is_bst_wrong_ordering_few_left"
         >:: fun _ ->
         assert_bool ""
           (not (is_bst (Node (5, Node (7, Leaf, Leaf), Node (8, Leaf, Leaf)))))
         )
       ; ( "is_bst_wrong_ordering_few_right"
         >:: fun _ ->
         assert_bool ""
           (not (is_bst (Node (5, Node (3, Leaf, Leaf), Node (4, Leaf, Leaf)))))
         )
       ; ( "is_bst_wrong_ordering_few_left_equal"
         >:: fun _ ->
         assert_bool ""
           (not (is_bst (Node (5, Node (5, Leaf, Leaf), Node (8, Leaf, Leaf)))))
         )
       ; ( "is_bst_wrong_ordering_few_right_equal"
         >:: fun _ ->
         assert_bool ""
           (not (is_bst (Node (5, Node (3, Leaf, Leaf), Node (5, Leaf, Leaf)))))
         )
       ; ( "is_bst_wrong_ordering_many_left"
         >:: fun _ ->
         assert_bool ""
           (not
              (is_bst
                 (Node
                    ( 5
                    , Node (3, Leaf, Leaf)
                    , Node (9, Node (8, Leaf, Leaf), Node (9, Leaf, Leaf)) ) ) ) )
         )
       ; ( "is_bst_wrong_ordering_many_right"
         >:: fun _ ->
         assert_bool ""
           (not
              (is_bst
                 (Node
                    ( 5
                    , Node (3, Leaf, Leaf)
                    , Node (9, Node (9, Leaf, Leaf), Node (10, Leaf, Leaf)) ) ) ) )
         ) ]

let makes_bst lst = assert_bool "" (is_bst (lst_to_tree lst))

let collapses_correct lst =
  assert_int_list_equal (List.sort compare lst)
    (List.sort compare (collapse (lst_to_tree lst)))

let test_sentence_to_tree =
  "test_sentence"
  >::: [ ("empty_is_bst" >:: fun _ -> makes_bst [])
       ; ("single_is_bst" >:: fun _ -> makes_bst [8])
       ; ("few_is_bst" >:: fun _ -> makes_bst [3; 9; 7])
       ; ("many_is_bst" >:: fun _ -> makes_bst [3; 7; 9; 23; 1])
       ; ("empty_collapses_correct" >:: fun _ -> collapses_correct [])
       ; ("single_collapses_correct" >:: fun _ -> collapses_correct [8])
       ; ("few_collapses_correct" >:: fun _ -> collapses_correct [3; 9; 7])
       ; ("few_same_collapses_correct" >:: fun _ -> collapses_correct [3; 3; 3])
       ; ( "many_collapses_correct"
         >:: fun _ -> collapses_correct [3; 3; 7; 3; 9; 23; 1] ) ]

let suite =
  "suite" >::: [test_map; test_foldl; test_is_bst; test_sentence_to_tree]

let () = run_test_tt_main suite

open OUnit2
open Exercises

let m1 = function Some _ :: _ -> true | _ -> false

let m2 = function [Some 1260; None] -> true | _ -> false

let m3 = function [Some _; _] -> true | _ -> false

let m4 = function _ :: _ :: _ -> true | _ -> false

let m5 = function _ :: _ -> true | _ -> false

let test_match_option_list =
  "match_option_list"
  >::: [ ( ""
         >:: fun _ ->
         assert_bool "failed to match l1 against (Some x)::tl" (m1 l1) )
       ; ( ""
         >:: fun _ ->
         assert_bool "failed to match l2 against ([Some 1260; None]" (m2 l2) )
       ; ( ""
         >:: fun _ ->
         assert_bool "failed to match l3 against [Some x; _]" (m3 l3) )
       ; ( ""
         >:: fun _ ->
         assert_bool "failed to match l4 against h1::h2::tl" (m4 l4) )
       ; ( ""
         >:: fun _ -> assert_bool "failed to match l5 against h :: tl" (m5 l5)
         ) ]

let test_is_before =
  "is_before"
  >::: [ ( ""
         >:: fun _ ->
         assert_bool "is_before (2021, 2, 1) (2021, 3, 1)"
           (is_before (2021, 2, 1) (2021, 3, 1)) )
       ; ( ""
         >:: fun _ ->
         assert_bool "is_before (2021, 2, 5) (2021, 2, 6)"
           (is_before (2021, 2, 5) (2021, 2, 6)) )
       ; ( ""
         >:: fun _ ->
         assert_bool "not (is_before (2021, 3, 4) (2021, 3, 2))"
           (is_before (2021, 2, 5) (2021, 2, 6)) ) ]

let test_earliest_date =
  "earliest_date"
  >::: [ ("none" >:: fun _ -> assert_equal None (earliest_date []))
       ; ("some"
         >:: fun _ ->
         assert_equal
           (Some (2021, 1, 1))
           (earliest_date
              [(2025, 1, 1); (2021, 1, 1); (2021, 1, 9); (2021, 2, 1)])) ]

let suite =
  "suite" >::: [test_match_option_list; test_is_before; test_earliest_date]

let () = run_test_tt_main suite

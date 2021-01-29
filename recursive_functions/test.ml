open OUnit2
open Exercises

let string_of_int_list l =
  "[ " ^ String.concat "; " (List.map string_of_int l) ^ " ]"
let assert_int_list_equal l1 l2 = assert_equal ~printer:string_of_int_list l1 l2

let sum_tests = 
  "test sum functions"
   >::: [
     ("" >:: fun _ -> assert_equal (sum [1; 2; 3]) 6);
     ("" >:: fun _ -> assert_equal (sum_tail [1; 2; 3]) 6);
   ]

let take_while_test = 
  "test takeWhile"
  >::: [
    ("" >:: fun _ -> assert_int_list_equal
     (takeWhile (fun x -> x < 4) [1; 2; 3; 4; 5; 3; 2])
     [1; 2; 3]);
    ("" >:: fun _ -> assert_int_list_equal
     (takeWhile (fun x -> x < 4) [1; 2; 3])
     [1; 2; 3]);
    ("" >:: fun _ -> assert_int_list_equal
     (takeWhile (fun x -> x < 4) [5; 6; 7])
     []);
    ("" >:: fun _ -> assert_int_list_equal
     (takeWhile (fun x -> x < 4) [])
     []);
    ("" >:: fun _ -> assert_int_list_equal
     (takeWhile (fun x -> x < 4) [5; 3; 2; 1])
     []);
  ]

let fib_fast_test = 
  "test fib_fast"
  >::: [
    ("" >:: fun _ -> assert_equal (fib_fast 6) 8);
    ("" >:: fun _ -> assert_equal (fib_fast 4) 3);
    ("" >:: fun _ -> assert_equal (fib_fast 0) 0);
  ]


  let suite = "suite" >::: [ sum_tests; take_while_test; fib_fast_test]
  let () = run_test_tt_main suite

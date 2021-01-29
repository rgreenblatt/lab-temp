(* Section: Using OUnit2 *)

open OUnit2

(* [head xs] is the first element of [xs], or raises [Not_found] when [xs] is empty. *)

let head : 'a list -> 'a = function [] -> raise Not_found | x :: _ -> x

(* Say we want to test the head function *)

(* let suite = "Test head" >::: [
    ("test1" >:: fun _ -> assert_equal 42 (head [42]));
    ("test2" >:: fun _ -> assert_equal 42 (head [0; 1]));
] *)

(* The expected answer in test2 should be 0. But we put 42 there.
The OUnit2 logging says nothing about 0 or 42 but simply [Failure: not equal].
We can improve the logging by telling [assert_equal] how to print 0 and 42.
Try running the test again with the improved test suite.
 *)

(* let suite = "Test head" >::: [
    ("test1" >:: fun _ -> assert_equal ~printer:string_of_int 42 (head [42]));
    ("test2" >:: fun _ -> assert_equal ~printer:string_of_int 42 (head [0; 1]));
] *)

(* [head xs] may raise an exception when [xs] is empty. But our test suite does
not cover this case. [OUnit2] provides [assert_raises] for this purpose. 
The second argument to [assert_raises] must be a function from [unit].
The function body is the actual program that we want to test. *)

let test_head =
  "head"
  >::: [
         ("empty" >:: fun _ -> assert_raises Not_found (fun _ -> head []));
         ( "test1" >:: fun _ ->
           assert_equal ~printer:string_of_int 42 (head [ 42 ]) );
         ( "test2" >:: fun _ ->
           assert_equal ~printer:string_of_int 0 (head [ 0; 1 ]) );
       ]

(* Uncomment and run the following suite to see what happens when a wrong exception
is given *)

(* let suite = "Test head" >::: [
    ("empty" >:: fun _ -> assert_raises (Failure "not found") (fun _ -> head []));
    ("test1" >:: fun _ -> assert_equal ~printer:string_of_int 42 (head [42]));
    ("test2" >:: fun _ -> assert_equal ~printer:string_of_int 0 (head [0; 1]));
] *)

(* Exercise: write a test suite for [index_of]  *)

(* [index_of x ys] is the index of the first occurrance of [x] in [ys] and 
raises [Not_found] if [x] does not occur in [ys]. *)
let rec index_of : 'a -> 'a list -> int =
 fun x ys ->
  match ys with
  | [] -> raise Not_found
  | y :: ys -> if x = y then 0 else 1 + index_of x ys

let test_index_of = "index_of" >::: []

let () = run_test_tt_main ("test" >::: [ test_head; test_index_of ])

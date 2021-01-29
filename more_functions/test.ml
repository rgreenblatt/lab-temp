open OUnit2 
open Exercises

let string_of_int_list l =
  "[ " ^ String.concat "; " (List.map string_of_int l) ^ " ]"
let assert_int_list_equal l1 l2 = assert_equal ~printer:string_of_int_list l1 l2
let test_compose = 
  "test proper composition" 
    >::: [
      ( "basic composition" >:: fun _ -> assert_equal 
        (compose (fun x -> x + 1) (fun x -> x + 2) 5)
        8);
    ]

let test_fold =
    "test power of fold"
    >::: [
      ("length" >:: fun _ -> assert_equal
        (length [1; 2; 3]) 3);
      ("map" >:: fun _ -> assert_int_list_equal 
       (map (fun x -> x + 1) [1; 2; 3]) [2; 3; 4] );
      ("reverse" >:: fun _ -> assert_int_list_equal
       (rev [1; 2; 3]) [3; 2; 1]);
      ("filter" >:: fun _ -> assert_int_list_equal 
        (filter (fun x -> x < 3) [1; 2; 3; 4]) [1; 2]);
    ]

let suite = "suite" >::: [ test_compose; test_fold]
let () = run_test_tt_main suite

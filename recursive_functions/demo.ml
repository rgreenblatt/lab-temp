let rec length (l: int list) : int = match l with 
  | [] -> 0
  | x :: xs -> 1 + length xs 

let rec length_tail (l: int list) (acc: int) : int = match l with
  | [] -> acc
  | x :: xs -> length_tail xs (acc + 1)

let rec even n =
  match n with
    | 0 -> true
    | x -> odd (x-1)
and odd n =
  match n with
    | 0 -> false
    | x -> even (x-1);;

let rec fibonacci n =
  if n < 3 then
    1
  else
    fibonacci (n-1) + fibonacci (n-2)
    
#trace fibonacci   
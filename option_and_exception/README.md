## Options And Exceptions 

In this module you will learn to work with Options and Exceptions 

For this module you will complete the following exercises:

(Exercises are borrowed from Functional Programming in OCaml (Spring 2019 Edition))

### Exercise: matching [✭]

For each pattern in the list below, give a value of type int option list that does not match the pattern and is not the empty list, or explain why that's impossible.

- `(Some x)::tl`
- `[Some 1260; None]`
- `[Some x; _]`
- `h1::h2::tl`
- `h :: tl`

### Exercise: date before [✭✭]

Define a date-like triple to be a value of type `int*int*int`. Examples of date-like triples include `(2013, 2, 1)` and `(0,0,1000)`. A date is a date-like triple whose first part is a positive year (i.e., a year in the common era), second part is a month between 1 and 12, and third part is a day between 1 and 31 (or 30, 29, or 28, depending on the month and year). `(2013, 2, 1)` is a date; `(0,0,1000)` is not. Write a function is_before that takes two dates as input and evaluates to true or false. It evaluates to true if the first argument is a date that comes before the second argument. (If the two dates are the same, the result is false.) Your function needs to work correctly only for dates, not for arbitrary date-like triples. However, you will probably find it easier to write your solution if you think about making it work for arbitrary date-like triples. For example, it's easier to forget about whether the input is truly a date, and simply write a function that claims (for example) that January 100, 2013 comes before February 34, 2013—because any date in January comes before any date in February, but a function that says that January 100, 2013 comes after February 34, 2013 is also valid. You may ignore leap years.

### Exercise: earliest date [✭✭✭] 

Write a function `earliest : (int*int*int) list -> (int*int*int) option`. It evaluates to `None` if the input list is empty, and to `Some d` if date d is the earliest date in the list. Hint: use `is_before`. *)
  

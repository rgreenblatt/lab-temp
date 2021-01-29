## Records And Algebraic Data Types 

This module is intended to give you more experience in defining and working with records and algebraic data types.
You are expected test your implementations. 

For this module you will complete the following exercises:

(Some exercises are borrowed from Functional Programming in OCaml (Spring 2019 Edition))

### Exercise: Languages [✭]

Implement a record named `Language`. It is expected to have a `name` that is a string,
boolean field `compiled` that denotes if the language is a compiled language and an optional field
`target` that denotes the target language, if the language is compiled 

### Exercise: Map and Fold_left [✭✭]

Using the list type we have defined, implement the functions `map` and `foldl` that behavious exactly 
as `map` and `fold_left` defined on standard library lists. 

### Exercise: Custome Trees [✭✭]

Implement your own ADT representing a Tree

### Exercise: String To Tree [✭✭]

Implement the function `sentence_to_tree` that takes a list of string and turns it into a tree
where each string is represented as a node. 

### Exercise: Traverse & Collapse [✭✭]

Implement the function `tree_traverse` that takes in a tree of string and collapses the strings into a single sentence, using pre-order traversal. 

Experiement with in order and post order traversal. How is the output different? 

### Exercise: depth [✭✭]

Write a function depth : 'a tree -> int that returns the number of nodes in any longest path from the root to a leaf. For example, the depth of an empty tree (simply Leaf) is 0, and the depth of tree t above is 3. Hint: there is a library function max : 'a -> 'a -> 'a that returns the maximum of any two values of the same type.

### Exercise: Is BST? [✭✭✭✭]

Write a function is_bst : ('a*'b) tree -> bool that returns true if and only if the given tree satisfies the binary search tree invariant. An efficient version of this function that visits each node at most once is somewhat tricky to write. Hint: write a recursive helper function that takes a tree and either gives you (i) the minimum and maximum value in the tree, or (ii) tells you that the tree is empty, or (iii) tells you that the tree does not satisfy the invariant. Your is_bst function will not be recursive, but will call your helper function and pattern match on the result. You will need to define a new variant type for the return type of your helper function.

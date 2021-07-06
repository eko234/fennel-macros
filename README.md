# fennel-macros
Some useful macros for the fennel programming language.


## decorate
sometimes the arrow macro `->` doesn't result idiomatic to communicate
function composition in a decorator-like way, you can use decorate
for this:
`(decorate [decorator1 decorator2] actual_function)`

this code will expand to:
`(-> actual_function (decorator1) (decorator2))`


## unless
fennel has a `when` macro to evaluate a body for its side effects,
sometimes you want to evaluate a body when a condition is false, you could
easily write your own or use `not`, buy `unless` is here to help though.



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


## protect
the protect macros work in the spirit of a try catch block, `protect_bailing_returning`
will run the body and return two values that correspond to the internal pcall, which means
that it will return at the first unhandled error or when the body is totally evaluated.

`protect_bailing_with` will do the same that `protect_bailing_returning` but it takes
a function as its first argument, and if some computation inside the body raises an error
that function will be called with the result of the failed computation, usually the error message, as
its first argument, this is very useful when you want a uniform way to handle exceptions while doing assertions

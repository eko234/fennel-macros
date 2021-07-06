; For lua version after 5.1 change unpack to table.unpack
(fn decorate* [list_of_decorators a_function]
  "function composition in a more decorator way fashion"
  `(-> ,a_function ,(unpack (icollect [_ v (ipairs d)] `(,v)))))

(fn unless* [condition body1 ...]
  "Evaluate body for side-effects only when condition is falsy."
  (assert body1 "expected body")
  `(if (not ,condition)
       (do
         ,body1
         ,...)))

{:decorate decorate* 
 :unless unless*}

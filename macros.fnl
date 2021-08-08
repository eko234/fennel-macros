; For lua version after 5.1 change unpack to table.unpack
(fn decorate* [list_of_decorators a_function]
  "function composition in a more decorator way fashion"
  `(-> ,a_function ,(unpack (icollect [_ v (ipairs list_of_decorators)] `(,v)))))

(fn unless* [condition body1 ...]
  "Evaluate body for side-effects only when condition is falsy."
  (assert body1 "expected body")
  `(if (not ,condition)
       (do
         ,body1
         ,...)))

(fn protect_bailing_returning [...]
  `(let 
     [(ok# result#)
      (pcall
       #(do 
         ,(unpack
           (icollect
            [_ v (ipairs [...])]
            v))))]
     (values ok# result#)))


(fn protect_bailing_with! [f ...]
  `(let 
     [(ok# result#)
      (pcall
       #(do 
         ,(unpack
           (icollect
            [_ v (ipairs [...])]
            v))))]
     (when (not ok#)
       (,f result#))))


{:decorate decorate* 
 :unless unless*}

; For lua version after 5.1 change unpack to table.unpack
(fn decorate [list_of_decorators a_function]
  `(-> ,a_function ,(unpack (icollect [_ v (ipairs d)] `(,v)))))


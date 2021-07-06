(fn protect* [guard_function actual_function error_message]
    "take a function and return a function that only works when 
    applying f1 as an assertion to its args is truthy"
    (fn [...]
        (assert guard_function (unpack [...]) error_message)
        (actual_function (unpack [...]))))


{:protect protect*}

(module
  ;; $add is name of the function; $left and $right are names of its arguments
  (func $add (param $left i32) (param $right i32) (result i32)
    (i32.add
      (get_local $left)
      (get_local $right)
    )
  )
  (export "add" (func $add))
)

(module
  ;; imports table from JavaScript
  (import "js" "table" (table 1 anyfunc))
  ;; stores hellofunc in table imported from JavaScript
  (elem (i32.const 0) $world)
  (func $world (result i32)
    i32.const 16
  )
  ;; data writes Hello World string to memory which is then exported and can be read in JavaScript
  (data (i32.const 16)
    "Hello World\00"
  )
  ;; 1 indicates that the memory must have at least 1 page of memory
  (memory 1)
  (export "memory" (memory 0))
  (export "world" (func $world))
)

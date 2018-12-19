(module
  ;; imports table from JavaScript
  (import "js" "table" (table 1 anyfunc))
  (type $void_to_i32 (func (result i32)))
  (func (export "hello") (result i32)
   i32.const 0
   ;; calls function on index 0 (pops the prev. pushed value from stack)
   call_indirect (type $void_to_i32))
)

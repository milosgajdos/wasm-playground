(module
  ;; $hello returns the length of data buffer
  (func $hello (result i32)
    i32.const 16
  )
  ;; data stores Hello World string in memory which is then exported
  (data (i32.const 16)
    "Hello World\00"
  )
  (memory 1)
  (export "memory" (memory 0))
  (export "hello" (func $hello))
)

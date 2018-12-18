# HOWTO

If you're interested in understanding the WAST code snippets, you might want to read [Understanding WebAssembly text format
](https://developer.mozilla.org/en-US/docs/WebAssembly/Understanding_the_text_format) first.

Build WASM module:

```
$ wat2wasm helloworld.wat -o helloworld.wasm
```

This will produce `helloworld.wasm` binary. In order to see what it does you need to write some HTML and JavaScript which will load the code and run the exported `add` function.

If you want to invoke `add` function in WAST code you can do so as follows:
```
(call $add (i32.const 5) (i32 9) )
```
You can inspect the built WASM binary by running the following command:
```
$ wasm-objdump helloworld.wasm -x

helloworld.wasm:	file format wasm 0x1

Section Details:

Type[1]:
 - type[0] (i32, i32) -> i32
Function[1]:
 - func[0] sig=0 <add>
Export[1]:
 - func[0] <add> -> "add"
```

You can see the function definition type, its position in the function table and finally its export.

If you would like to see how the code is executed in the WASM runtime i.e. actual stack machine execution:
```
$ wasm-objdump helloworld.wasm -d

helloworld.wasm:	file format wasm 0x1

Code Disassembly:

000021 <add>:
 000023: 20 00                      | get_local 0
 000025: 20 01                      | get_local 1
 000027: 6a                         | i32.add
 000028: 0b                         | end
```

You can see that first variable is pushed on top of the stack, then the second one is pushed on top of it and then add instruction is pushed on top of both of them. Then the instructions and variables are popped off and the result of the instruction is pushed on top of the stack.

You can also reverse the WASM binary back to WAST:
```
$ wasm2wat helloworld.wasm -o helloworld_reverse.wat
```

If you inspect the resulting `.wat` file it looks slightly different as it contains a **type** definition of a function type and then creates the function of that type.

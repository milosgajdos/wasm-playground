# HOWTO

If you're interested in understanding the WAST code snippets, you might want to read [Understanding WebAssembly text format
](https://developer.mozilla.org/en-US/docs/WebAssembly/Understanding_the_text_format) first.

Build WASM module:

```
$ wat2wasm helloworld.wat -o helloworld.wasm
```

This will produce `helloworld.wasm` binary. In order to see what it does you need to write some HTML and JavaScript which will load the code and run the exported `add` function.

You can inspect the built WASM binary by running the following command:
```
$ wasm-objdump helloworld.wasm -x

helloworld.wasm:	file format wasm 0x1

Section Details:

Type[1]:
 - type[0] () -> i32
Function[1]:
 - func[0] sig=0 <hello>
Memory[1]:
 - memory[0] pages: initial=1
Export[2]:
 - memory[0] -> "memory"
 - func[0] <hello> -> "hello"
Data[1]:
 - segment[0] size=12 - init i32=16
  - 0000010: 4865 6c6c 6f20 576f 726c 6400            Hello World.
```

You can see the function definition type, its position in the function table, memory allocation and their exports.
Finally you can see the module's data containing 16 signed integers and the content of the data (Hello World string)

You can also reverse the WASM binary back to WAST:
```
$ wasm2wat helloworld.wasm -o helloworld_reverse.wat
```

If you inspect the resulting `.wat` file it looks slightly different as it contains a **type** definition of a function type and then creates the function of that type. The rest is pretty much the same as the original code.

# RUN

Start a simple webserver to serve the HTML file:
```
$ emrun --no_browser --port 8080 .
```

Follow the displayed URL to run the WASM code in the browser (make sure you click on `helloworld.html` link)

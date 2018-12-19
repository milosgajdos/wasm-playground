# HOWTO

If you're interested in understanding the WAST code snippets, you might want to read [Understanding WebAssembly text format
](https://developer.mozilla.org/en-US/docs/WebAssembly/Understanding_the_text_format) first.

This example builds two WASM modules: `hello.wasm` and `world.wasm`. Each module defines a single function with the same name as the module: `hello` and `world`. `hello.wasm` module stores `hello` function in a table imported from JavaScript. This function is then called by `world` function from JavaScript.

Build WASM module:

```
$ wat2wasm hello.wat -o hello.wasm
$ wat2wasm world.wat -o world.wasm
```

This will produce `hello.wasm` and `world.wasm` binaries. In order to use them we need to write some JavaScript, especially since both modules import JavaScript table for storing and calling functions from it.

You can inspect the `hello.wasm` by running the following command:
```
$ wasm-objdump hello.wasm -x

hello.wasm:	file format wasm 0x1

Section Details:

Type[1]:
 - type[0] () -> i32
Import[1]:
 - table[0] elem_type=anyfunc init=1 max=0 <- js.table
Function[1]:
 - func[0] sig=0 <hello>
Export[1]:
 - func[0] <hello> -> "hello"
```
You can see that the module imports a table from JavaScript and exports a function called "hello"

Similarly you can  inspect the `world.wasm` by running the following command:
```
$ wasm-objdump world.wasm -x

world.wasm:	file format wasm 0x1

Section Details:

Type[1]:
 - type[0] () -> i32
Import[1]:
 - table[0] elem_type=anyfunc init=1 max=0 <- js.table
Function[1]:
 - func[0] sig=0 <world>
Memory[1]:
 - memory[0] pages: initial=1
Export[2]:
 - memory[0] -> "memory"
 - func[0] <world> -> "world"
Elem[1]:
 - segment[0] table=0 count=1 - init i32=0
  - elem[0] = func[0] <world>
Data[1]:
 - segment[0] size=12 - init i32=16
  - 0000010: 4865 6c6c 6f20 576f 726c 6400            Hello World.
```

This module also imports JavaScript table -- it's the same table as `hello.wasm` imports -- then exports function "world" and memory (for writing the "Hellow World" string). It also stores world function in the imported table on offset 0 (see the `Elem`) part above.

You can also reverse both WASM binaries back to WAST the usual way:
```
$ wasm2wat hello.wasm -o hello_reverse.wat
$ wasm2wat world.wasm -o world_reverse.wat
```

# RUN

Start a simple webserver to serve the HTML file:
```
$ emrun --no_browser --port 8080 .
```

Follow the displayed URL to run the WASM code in the browser (make sure you click on `helloworld.html` link)

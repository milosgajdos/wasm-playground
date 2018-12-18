# HOWTO

Compile `hello3.c` into WASM

```
$ emcc -o hello3.html hello3.c -O3 -s WASM=1 --shell-file html_template/shell_minimal.html -s NO_EXIT_RUNTIME=1 -s EXTRA_EXPORTED_RUNTIME_METHODS='["ccall"]'
```

Options:
```
-o hello3.html       - output HTML file; you can also request JavaScript file
-s WASM=1            - request wasm output; otherwise asm.js output is generated
--shell-file         - specifies a path to HTML template used to generate result
-s NO_EXIT_RUNTIME=1 - keep the runtime alive after main() exits (this is because
                       the function we want to compiled into WASM is run outside main() function)
-s EXTRA_EXPORTED_RUNTIME_METHODS='["ccall"]' - run C function call
```

You can read more about `ccall` (and `cwrap`) [here](https://kripken.github.io/emscripten-site/docs/porting/connecting_cpp_and_javascript/Interacting-with-code.html#calling-compiled-c-functions-from-javascript-using-ccall-cwrap).

This will produce the following files:
```
hello3.c
hello3.html
hello3.js
hello3.wasm
html_template
```
You need to open `hello3.html` file in a browser now. Make sure you browser supports running WASM.

Alternatively you can start a simple web server and access the file via the URL printed out when running the webserver command below:
```
emrun --no_browser --port 8080 .
```
If you want to check out the text representation of the compiled WASM module run the following command:

```
$ wasm2wat hello3.wasm
```

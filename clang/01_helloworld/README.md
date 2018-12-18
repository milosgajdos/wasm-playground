# HOWTO

Compile `hello.c` into WASM

```
$ emcc hello.c -s WASM=1 -o hello.html
```

Options:
```
-o hello2.html  - output HTML file; you can also request JavaScript file
-s WASM=1       - request wasm output; otherwise asm.js output is generated
```

This will produce the following files:
```
$ ls -1
hello.c
hello.html
hello.js
hello.wasm
```
You need to open `hello.html` file in a browser, now. Make sure you browser supports running WASM.

Alternatively you can start a simple web server and access the file via the URL printed out when running the webserver command below:
```
emrun --no_browser --port 8080 .
```

If you want to check out the text representation of the compiled WASM module run the following command:

```
$ wasm2wat hello.wasm
```

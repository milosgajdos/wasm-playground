# HOWTO

Compile `hello2.c` into WASM

```
$ emcc -o hello2.html hello2.c -O3 -s WASM=1 --shell-file html_template/shell_minimal.html
```

Options:
```
-o hello2.html  - output HTML file; you can also request JavaScript file
-s WASM=1       - request wasm output; otherwise asm.js output is generated
--shell-file    - specifies a path to HTML template used to generate result
```

This will produce the following files:
```
$ ls -1
hello2.c
hello2.html
hello2.js
hello2.wasm
html_template
```
You need to open `hello2.html` file in a browser now. Make sure you browser supports running WASM.

Alternatively you can start a simple web server and access the file via the URL printed out when running the webserver command below:
```
emrun --no_browser --port 8080 .
```
If you want to check out the text representation of the compiled WASM module run the following command:

```
$ wasm2wat hello2.wasm
```

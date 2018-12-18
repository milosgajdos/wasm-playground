# HOWTO

This example is from the following [guide](https://developer.mozilla.org/en-US/docs/WebAssembly/existing_C_to_wasm), which is unfortunately missing a few important bits to make it work. By following the guide here, though you should be able to get it working.

In order to get this example working you first need to compile [libwebp](https://github.com/webmproject/libwebp).
Clone the repo:

```
git clone https://github.com/webmproject/libwebp
```

Now it's time to compile the `webp.c` source file.

```
$ emcc -O3 -s WASM=1 -s EXTRA_EXPORTED_RUNTIME_METHODS='["cwrap"]' -I libwebp/ webp.c libwebp/src/{dec,dsp,demux,enc,mux,utils}/*.c
```

Options:
```
-o hello3.html       - output HTML file; you can also request JavaScript file
-s WASM=1            - request wasm output; otherwise asm.js output is generated
-s EXTRA_EXPORTED_RUNTIME_METHODS='["cwrap"]' - run C function call
-I points the emcc compiler to the libwep header files
```

You can read more about `cwrap` (and `ccall`) [here](https://kripken.github.io/emscripten-site/docs/porting/connecting_cpp_and_javascript/Interacting-with-code.html#calling-compiled-c-functions-from-javascript-using-ccall-cwrap).

This will produce the following files (note we have left out `libwep` director from the output below):
```
$ ls -1
a.out.js
a.out.wasm
image.jpg
webp.c
```

You now need to write a bit of JavaScript and HTML to use the generated `a.out.js` as per the guide mentioned earlier. Unfortunately the instructions in the guide are incomplete, so I've created correctly functioning `a.html` and added it into repo.

You can now check out the results by running the familiar web server and access the file via the URL printed out:
```
emrun --no_browser --port 8080 .
```

**Make sure you are acessing the a.html file in a browser which support WebP** -- Chrome supports it natively, Firefox might have some issues.

If you want to check out the text representation of the compiled WASM module run the following command:

```
$ wasm2wat hello3.wasm
```

const js = import("./helloworld_01.js");
js.then(js => {
  js.greet("WebAssembly");
});

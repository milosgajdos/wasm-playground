extern crate wasm_bindgen;

use wasm_bindgen::prelude::*;

// tells rust to call externally defined function called alert()
// wasm_bindgen attribute makes sure Rust knows how to find it
// alert() is actually JavaScript alert() function
// extern "C" is a part of Rust's FFI API
#[wasm_bindgen]
extern "C" {
    pub fn alert(s: &str);
}

// greet() defines a function that can be called by JavaScript
// wasm_bindgen makes sure greet() is available to JavaScript
// This is a call in the opposite direction of the extern "C" function defined above
#[wasm_bindgen]
pub fn greet(name: &str) {
    alert(&format!("Hello, {}!", name));
}

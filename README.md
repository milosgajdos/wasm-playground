# wasm-playground

This repo contains various samples of programs I hacked when learning about [WASM](https://webassembly.org/).

# Prerequisites

In order to get something meaningful out of following the cruft stored in this repo you need to install some software on your workstation first:

* `CMake` **version 3.2 or higher** ([homebrew](https://brew.sh/) formula/package is available for macOS users)
* You need to install WABT: [The WebAssembly Binary Toolkit](https://github.com/WebAssembly/wabt)
* You need to install [Emscripten](https://kripken.github.io/emscripten-site/docs/getting_started/downloads.html) Toolkit
* You need a browser which supports WASM. In my case that's [firefox](https://www.mozilla.org/en-GB/firefox/new/) which has WASM enabled by default in version 52+

## WABT

The toolkit contains some annoying `git` submodules so you need to clone the repo `recursive`ly

```
git clone --recursive https://github.com/WebAssembly/wabt
cd wabt
make
```

You can install the built `wabt` tools by running
```
make install
```
On macOS these are installed into `/usr/local/bin`.

## Emscripten

The guide available on the URL mentioned above is pretty straightforward; I'm adding the list of commands here so I dont have to browse through and open "hundreds" of browser tabs:

```
git clone https://github.com/juj/emsdk.git
cd emsdk
./emsdk install latest
./emsdk activate latest
source ./emsdk_env.sh
```

# Examples

The repo is structured into multiple subdirectories each containing some playground code written in some programming language; `clang` has source code written in `C`, `rust` in [Rust](https://www.rust-lang.org/) etc.

Each subdirectory has a list of steps how to build and run the code so you should be able to just follow the guide step by step.

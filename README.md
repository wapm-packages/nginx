# Nginx

You can install nginx with:

```shell
wapm install nginx
```

## Running

You can run nginx.

```shell
$ wapm run nginx -p example -c nginx.conf
2015/10/21 07:28:00 [notice] 73097#0: nginx/1.15.3
2015/10/21 07:28:00 [notice] 73097#0: built by clang 6.0.1  (emscripten 1.38.12 : 1.38.12)
2015/10/21 07:28:00 [notice] 73097#0: OS: Darwin
```

*Note: the example directory is taken from here: https://github.com/wapm-packages/nginx*

And you will have a webserver running in:
http://localhost:8080/

## Building from Source

You will need Emscripten SDK (emsdk) to build the `nginx.wasm` file.

Steps:

1. Setup emsdk (>= 1.38.11), see [Installation Instructions](https://github.com/juj/emsdk#installation-instructions)
2. Run `bash build.sh`

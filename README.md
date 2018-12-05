# Nginx WASM

This version is a slightly modified version of Nginx that it's able to compile to WASM.

In Darwin systems (OS X), we force the system to think it's Linux.

## Steps for configuring

If you need to reconfigure the build, you will need to run:

```
emconfigure ./configure --without-http_rewrite_module --without-http_gzip_module --crossbuild=Linux --builddir=objs_wasm --with-debug --with-cc-opt="-Wno-sign-compare" --with-ld-opt="-s WASM=1" --without-select_module --with-poll_module
```

After that, modify the `objs_wasm/Makefile` to add `-Wno-sign-compare` into the `CFLAGS`.
Also, you will need to modify the command `objs_wasm/nginx` to allow WASM generation:

```
	$(LINK) -o objs_wasm/nginx \
```

to:

```
	$(LINK)-o objs_wasm/nginx.js \
```

## Building

Once everything is configured, the following command will generate `objs_wasm/nginx.wasm`:

```
emmake make
```

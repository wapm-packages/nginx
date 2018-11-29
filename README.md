# Nginx WASM

This version is a slightly modified version of Nginx that it's able to compile to WASM.

In Darwin systems (OS X), we force the system to think it's Linux.
We did that, by modifying `auto/os/conf` from `. auto/os/darwin` to `. auto/os/linux`.

## Steps for configuring

If you need to reconfigure the build, you will need to run:

```
emconfigure ./configure --without-http_rewrite_module --without-http_gzip_module
```

After that, modify the `objs/Makefile` to add `-Wno-sign-compare` into the `CFLAGS`.
Also, you will need to modify the command `objs/nginx` to allow WASM generation:

```
	$(LINK) -o objs/nginx \
```

to:

```
	$(LINK) -s WASM=1 -o objs/nginx.js \
```

## Building

Once everything is configured, the following command will generate `objs/nginx.wasm`:

```
emmake make
```

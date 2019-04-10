# Download and compile sqlite3 to web assembly
echo "Configure"
cd nginx
emconfigure ./configure --without-http_rewrite_module --without-http_gzip_module --crossbuild=Linux --builddir=objs_wasm --with-debug --with-cc-opt="-Wno-sign-compare" --with-ld-opt="-s WASM=1" --without-select_module --with-poll_module

echo "Build"
emmake make

cp objs/nginx.wasm ..

echo "Done"

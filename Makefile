
default:	build

clean:
	rm -rf Makefile objs_wasm

build:
	$(MAKE) -f objs_wasm/Makefile

install:
	$(MAKE) -f objs_wasm/Makefile install

modules:
	$(MAKE) -f objs_wasm/Makefile modules

upgrade:
	/usr/local/nginx/sbin/nginx -t

	kill -USR2 `cat /usr/local/nginx/logs/nginx.pid`
	sleep 1
	test -f /usr/local/nginx/logs/nginx.pid.oldbin

	kill -QUIT `cat /usr/local/nginx/logs/nginx.pid.oldbin`

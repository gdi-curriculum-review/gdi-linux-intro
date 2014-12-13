clean :
	rm -rf build/

compile : clean
	mkdir -p build/
	gcc -o build/hellomake.out hello.c

install : compile
	cp build/hellomake.out /bin/hellomake

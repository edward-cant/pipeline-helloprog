.PHONY: clean dependencies main test

all: main

clean:
	rm -f Binaries/main
	rm -rf Binaries/
	mkdir -p Binaries/

dependencies: ./Binaries/dependencies/libhello.tar.gz
	tar -xvf ./Binaries/dependencies/libhello.tar.gz -C Binaries/

main: dependencies Binaries/main
Binaries/main: main.c
	gcc -o Binaries/main -I Binaries/include/ main.c Binaries/lib/libhello.a

test: Binaries/main
	./test.sh


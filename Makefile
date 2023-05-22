.PHONY: clean main test

all: main

clean:
	rm -f Binaries/main

main: Binaries/main
Binaries/main: main.c
	gcc -o Binaries/main -I Binaries/include/ main.c Binaries/lib/libhello.a

test: Binaries/main
	./test.sh


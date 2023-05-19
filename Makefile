.PHONY: clean

all: main

clean:
	rm -f Binaries/main

main: main.c
	gcc -o Binaries/main -I Binaries/include/ main.c Binaries/lib/libhello.a

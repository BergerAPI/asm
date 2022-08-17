main: asm.o
	gcc -m64 -no-pie -o j asm.o

asm.o:
	nasm -f elf64 src/rsa.asm -o asm.o

clean:
	rm -f -- asm.o j
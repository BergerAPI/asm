main: c.o asm.o
	gcc -m64 -no-pie -o j asm.o c.o

asm.o:
	nasm -f elf64 src/add.asm -o asm.o

c.o:
	gcc -c src/add.c -o c.o
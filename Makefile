SRC=src
IDIR=$(SRC)/include
SOURCE=$(SRC)/gcd.asm

all:
	nasm -f elf32 -i $(IDIR) -g -o gcd.o $(SOURCE);
	ld -m elf_i386 -o gcd gcd.o -g;
	rm gcd.o

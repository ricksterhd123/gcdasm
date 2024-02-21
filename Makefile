SRC=src
IDIR=$(SRC)/include
TDIR=$(SRC)/test
SOURCE=$(SRC)/gcd.asm
DEPS=$(IDIR)/gcd.inc
ODIR=build

all:
	@mkdir -p $(ODIR)
	nasm -f elf32 -i $(IDIR) -g -o $(ODIR)/gcd.o $(SOURCE)
	ld -m elf_i386 -o ${ODIR}/gcd $(ODIR)/gcd.o -g

test:
	@mkdir -p $(ODIR)
	nasm -f elf32 -g $(DEPS) -o $(ODIR)/gcd.lib.o
	gcc -c -m32 -g $(TDIR)/gcd.test.c -o $(ODIR)/gcd.test.o
	gcc -m32 $(ODIR)/gcd.test.o $(ODIR)/gcd.lib.o -o $(ODIR)/gcd.test 
	./$(ODIR)/gcd.test

clean:
	rm -rf $(ODIR)

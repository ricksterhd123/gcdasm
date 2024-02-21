SRC=src
IDIR=$(SRC)/include
SOURCE=$(SRC)/gcd.asm
ODIR=build

all:
	@mkdir -p $(ODIR)
	nasm -f elf32 -i $(IDIR) -g -o $(ODIR)/gcd.o $(SOURCE);
	ld -m elf_i386 -o ${ODIR}/gcd $(ODIR)/gcd.o -g;

clean:
	rm -rf $(ODIR)

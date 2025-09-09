CC = gcc
CFLAGS = -m32 -fno-stack-protector -fno-PIC
NASM = nasm
ASM_FLAGS = -f elf32 -g
LD = gcc
LDFLAGS = -m32 -g -lrt

file: file.o nano.o

%.o : %.asm
	$(NASM) $(ASM_FLAGS) -o $@ $<

%.o : %.c
	$(CC) $(CFLAGS) -c -o $@ $<

clean: 
	rm -f *.o file *.s
	rm -f *~ 

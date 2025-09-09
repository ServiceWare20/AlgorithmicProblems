CC=gcc
LD=gcc
LDFLAGS = -m32 -g
BINARIES=main1 main2

all : main1 main2

main1: main.c
	$(CC) -Ifirst_head -m32 -g -o $@ $<

main2: main.c
	$(CC) -Isecond_head -m32 -g -o $@ $<

clean: 
	rm -f *.o $(BINARIES) *.s

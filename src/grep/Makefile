СС = gcc 
CFLAGS = -std=c11 -Werror -Wextra -Wall
LDFLAGS = -D_GNU_SOURCE

all: s21_grep clean

s21_grep: grep3.o grepFn.o
	$(CC) grep3.o grepFn.o -o s21_grep 

grep3.o: grep3.c 
	$(CC) $(CFLAGS) $(LDFLAGS) -c grep3.c

grepFn.o: grepFn.c grepFn.h
	$(CC) $(CFLAGS) $(LDFLAGS) -c grepFn.c

clean:
	rm *.o
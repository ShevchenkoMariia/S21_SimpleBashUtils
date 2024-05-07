СС = gcc 
CFLAGS = -std=c11 -Werror -Wextra -Wall
LDFLAGS = -D_GNU_SOURCE

all: s21_grep clean

s21_grep: grep.o grepFn.o
	$(CC) grep.o grepFn.o -o s21_grep 

grep3.o: grep.c 
	$(CC) $(CFLAGS) $(LDFLAGS) -c grep.c

grepFn.o: grepFn.c grepFn.h
	$(CC) $(CFLAGS) $(LDFLAGS) -c grepFn.c

clean:
	rm *.o
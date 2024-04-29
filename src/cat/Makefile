СС = gcc 
CFLAGS = -std=c11 -Werror -Wextra -Wall
LDFLAGS =

all: s21_cat s21_grep clean

s21_cat: cat.o implementationCat.o
	$(CC) cat.o implementationCat.o -o s21_cat 

cat.o: cat.c 
	$(CC) $(CFLAGS) -c cat.c

implementationCat.o: implementationCat.c implementationCat.h
	$(CC) $(CFLAGS) -c implementationCat.c

clean:
	rm *.o

s21_grep: grep.o
	$(CC) grep.o -o s21_grep
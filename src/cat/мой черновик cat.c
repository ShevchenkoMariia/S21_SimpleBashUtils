//принять аргументы
//распределить аргмуенты выясняя флаги
//реализовать функции ля каждого флага

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

typedef struct Flags {
  int b;
  int e;
  int n;
  int s;
  int t;
  int v;
} flags;

int sort_flags(int argc, char *argv[], flags *flag);
void name_error(int num_error);
int error_name(int argc, char *argv[]);

int main(int argc, char *argv[]) {
  int num_error = error_name(argc, argv);
  name_error(num_error);
  flags oll_flags = {0, 0, 0, 0, 0, 0};
  // for(int i = 0; i < argc; i++)
  // printf("-- %s --\n", argv[i]);
  int sum_flags = sort_flags(argc, argv, &oll_flags);
  /*if(sum_flags == 0 && argc > 1) //вызов функции, которая выводит на экран
  текст файла или файлов else //определяем флаг и вызываем соответствующую
  функцию*/

  return 0;
}

int sort_flags(int argc, char *argv[], flags *flag) {
  int count = 0;
  for (int i = 0; i < argc; i++) {
    if (strcmp(argv[i], "-b") == 0 ||
        strcmp(argv[i], "--number-nonblank") == 0) {
      flag->b = 1;
      count++;
    }
    if (strcmp(argv[i], "-e") == 0 || strcmp(argv[i], "-E") == 0) {
      flag->e = 1;
      count++;
    }
    if (strcmp(argv[i], "-n") == 0 || strcmp(argv[i], "--number") == 0) {
      flag->n = 1;
      count++;
    }
    if (strcmp(argv[i], "-s") == 0 || strcmp(argv[i], "--squeeze-blank") == 0) {
      flag->s = 1;
      count++;
    }
    if (strcmp(argv[i], "-t") == 0 || strcmp(argv[i], "-T") == 0) {
      flag->t = 1;
      count++;
    }
    if (strcmp(argv[i], "-v") == 0) {
      flag->v = 1;
      count++;
    }
  }
  return count;
  // printf("-b = %d, -e = %d, -n = %d, -s = %d, -t = %d, -v =
  // %d\n",flag->b,flag->e,flag->n, flag->s, flag->t, flag->v);
}

//ошибки

//функция выводящая имя ошибки
void name_error(int num_error) {
  if (num_error == 1) printf("Побробуйте ещё раз, добавив имя файла\n");
  /*if(num_error == 2) printf();
  if(num_error == 3) printf();
  if(num_error == 4) printf();
  if(num_error == 5) printf();*/
}

int error_name(int argc, char *argv[]) {
  return argc == 1 && strcmp(argv[0], "./a.out") == 0 ? 1 : 100;
}

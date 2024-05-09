#ifndef GREP_FN
#define GREP_FN

#include <regex.h>
#include <stdbool.h>
#include <stdio.h>

typedef struct {
  bool E;  //шаблон
  bool I;  //игнор регистров
  bool V;  //инвертирует смысл поиска соответствий
  bool C;  //выводит только количество совпадающих строк
  bool L;  //выводит только совпадающие файлы
  bool N;  //предваряет каждую строку вывода номером строки из файла ввода
  bool H;  //подавление выводы имени файла
  bool S;  //подавление ошибки открытия файла
  bool O;  //печатает только совпавшие части строки
  bool unknown;  //неизвестный флаг
} Flags;

int CountArg(int argc, char* argv[]);
int SearchPattern(int argc, char* argv[]);
void PriorityOfFlags(Flags* flags);
void SearchFlags(int argc, char* argv[], Flags* flags);
void ValidationCheckFile(int argc, char* argv[], Flags flags);
void UsingTheFlagO(Flags* flags, regex_t* regex, char* line, int countStr,
                   int countFile, char* filename);

#endif
#include "implementationCat.h"

int main(int argc, char* argv[]) {
  Flags flags = CatReadFlags(argc, argv);
  const char* table[256];
  CatSetTable(table);
  if(flags.unknown) fprintf(stderr, "Try 'cat --help' for more information.\n");
  else {
    if (flags.markEndl) CatSetEndl(table);  //$ в конце строки
    if (flags.printNonPrintable) CatSetNonPrintable(table);  //нечитаемые знаки
    if (flags.tab) CatTab(table);  //обработка табов

    if (!(CheckingForManualInput(argc, argv)) || argc == 1 || (argv[1][0] == '-' && (int)strlen(argv[1]) == 1))
      CatFile(stdin, flags, table);
    else
      Cat(argc, argv, flags, table);
  }
  return 0;
}

/*не обработана кирилица.
Утилита `cat` в Unix-подобных системах обрабатывает все символы,
которые могут быть представлены в виде байтов. Это включает в себя все
символы из стандартной таблицы ASCII и, в случае использования расширенных
кодировок, символы из соответствующих таблиц, таких как UTF-8.*/

/*-diff <(./s21_cat -e test_2.txt) <(cat -e test_2.txt)
-diff <(./s21_cat -v test_2.txt) <(cat -v test_2.txt)
-diff <(./s21_cat -s test_2.txt) <(cat -s test_2.txt) -
-diff <(./s21_cat -n test_2.txt) <(cat -n test_2.txt) -
-diff <(./s21_cat -t test_2.txt) <(cat -t test_2.txt)
-diff <(./s21_cat -b test_2.txt) <(cat -b test_2.txt) -
-diff <(./s21_cat -T test_2.txt) <(cat -e test_2.txt)
-diff <(./s21_cat -E test_2.txt) <(cat -v test_2.txt)
-diff <(./s21_cat --number-nonblank test_2.txt) <(cat -s test_2.txt) -
-diff <(./s21_cat --number test_2.txt) <(cat -s test_2.txt) -
-diff <(./s21_cat --squeeze-blank test_2.txt) <(cat -s test_2.txt) -
test_2.txt*/
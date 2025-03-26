#include "implementationCat.h"

int main(int argc, char* argv[]) {
  Flags flags = CatReadFlags(argc, argv);
  const char* table[256];
  CatSetTable(table);
  if (flags.unknown)
    fprintf(stderr, "Try 'cat --help' for more information.\n");
  else {
    if (flags.markEndl) CatSetEndl(table);  //$ в конце строки
    if (flags.printNonPrintable) CatSetNonPrintable(table);  //нечитаемые знаки
    if (flags.tab) CatTab(table);  //обработка табов

    if (!(CheckingForManualInput(argc, argv)) || argc == 1 ||
        (argv[1][0] == '-' && (int)strlen(argv[1]) == 1))
      CatFile(stdin, flags, table);
    else
      Cat(argc, argv, flags, table);
  }
  return 0;
}
#ifndef MIMPLEMENTATION_CAT_H
#define MIMPLEMENTATION_CAT_H

#include <stdio.h>
#include <stdbool.h>

typedef struct {
  bool numberNonBlank;
  bool markEndl;
  bool numberAll;
  bool squeeze;
  bool tab;
  bool printNonPrintable;
} Flags;

Flags CatReadFlags(int argc, char* argv[]);
int CheckingForManualInput(int argc, char* argv[]);
void CatSetTable(const char* table[static 256]);
void CatSetEndl(const char* table[static 256]);
void CatSetNonPrintable(const char* table[static 256]);
void CatTab(const char* table[static 256]);
void CatFile(FILE* file, Flags flags, const char* table[static 256]); //возможно стоит поменять
void Cat(int argc, char* argv[], Flags flags, const char* table[static 256]); //местами аргументы

#endif
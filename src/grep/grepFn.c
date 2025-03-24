#include "grepFn.h"

#include <getopt.h>
#include <stdlib.h>
#include <string.h>

int CountFile(int argc, char* argv[]);
void CompilingAnExpression(int argc, char* argv[], FILE* file, Flags flags,
                           char* filename);
void MatchSearch(int argc, char* argv[], FILE* file, Flags flags,
                 char* filename, regex_t* regex, int patternLenght);
void UsingTheFlagC(Flags* flags, char* filename, int countFile, int countMatch,
                   int countNoMatch);
void OutputToTheLine(Flags* flags, char* filename, int countFile, int countStr,
                     int* countL);
void UsingTheFlagV(Flags* flags, char* filename, int countFile, int countStr,
                   char* line);
void OutputWhiteText(Flags* flags, char* line, int countFile, int i);
void PrintingMatches(Flags* flags, regmatch_t match[], char* line,
                     int countFile);

void SearchFlags(int argc, char* argv[], Flags* flags) {
  int currentFlag = 0;
  while ((currentFlag = getopt(argc, argv, "eivclnhso")) != -1) {
    switch (currentFlag) {
      case 'e':
        flags->E = true;
        break;
      case 'i':
        flags->I = true;
        break;
      case 'v':
        flags->V = true;
        break;
      case 'c':
        flags->C = true;
        break;
      case 'l':
        flags->L = true;
        break;
      case 'n':
        flags->N = true;
        break;
      case 'h':
        flags->H = true;
        break;
      case 's':
        flags->S = true;
        break;
      case 'o':
        flags->O = true;
        break;
      default:
        flags->unknown = true;
        break;
    }
  }
}

void PriorityOfFlags(Flags* flags) {
  if (flags->unknown == true) {
    fprintf(stderr,
            "Usage: grep [OPTION]... "
            "PATTERNS [FILE]...\nTry 'grep --help' for more information.\n");
  }
  if (!flags->E && !flags->I && !flags->V && !flags->C && !flags->L &&
      !flags->N && !flags->H && !flags->O && !flags->unknown)
    flags->E = true;

  if (flags->L && flags->N) flags->N = false;
  if (flags->L && flags->E) flags->E = false;
}

int SearchPattern(int argc, char* argv[]) {
  int pattern = 0;
  if (argv[1][0] == '-' && argv[1][1] == 'e' && (int)strlen(argv[1]) > 2 &&
      argc > 2) {
    int len = (int)strlen(argv[1]);
    char result[len];
    memmove(result, argv[1] + 2, len - 2);
    result[len - 2] = '\0';
    strcpy(argv[1], result);
  }
  for (int i = 1; i < argc - 2; i++) {
    if (argv[i - 1][0] == '-') {
      pattern = 1;
      break;
    }
  }
  if (pattern == 0 && argc >= 3) pattern = 1;
  return pattern;
}

int CountArg(int argc, char* argv[]) {
  int error = 0;
  if (argc == 2 && argv[1][0] == '-') {
    error++;
    fprintf(stderr,
            "Usage: grep [OPTION]... PATTERNS [FILE]...\nTry 'grep --help' for "
            "more information.\n");
  }
  if ((argc == 2 && argv[1][0] != '-') ||
      (argc == 3 && argv[1][0] == '-' && argv[1][1] != 'e')) {
    while (1) {
      char c = getchar();
      (void)c;
    }
  }
  return error;
}

void ValidationCheckFile(int argc, char* argv[], Flags flags) {
  char* filename = NULL;
  if (argv[1][1] == 'e' && (int)strlen(argv[1]) > 2 && argc > 2) {
    filename = argv[2];
    FILE* file = fopen(filename, "rb");
    if (file == NULL && flags.S)
      file = NULL;
    else if (file == NULL && !flags.S)
      fprintf(stderr, "%s: %s: No such file or directory\n", argv[0], filename);
    else {
      CompilingAnExpression(argc, argv, file, flags, filename);
      fclose(file);
    }
  }
  for (int i = 1; i < argc; i++) {
    if (argv[i][0] == '-' && i == 1 && i + 2 <= argc - 1 &&
        (int)strlen(argv[1]) != 1)
      i += 2;
    if (argv[i][0] != '-' && i == 1 && i + 1 <= argc - 1 &&
        (int)strlen(argv[1]) != 1)
      i++;
    if (argv[i][0] == '-' && i == 1 && (int)strlen(argv[1]) == 1) i++;
    if (argv[i][0] != '-' && i == 1) i++;
    filename = argv[i];

    FILE* file = fopen(argv[i], "rb");
    if (file == NULL && flags.S)
      file = NULL;
    else if (file == NULL && !flags.S)
      fprintf(stderr, "%s: %s: No such file or directory\n", argv[0], argv[i]);
    else {
      CompilingAnExpression(argc, argv, file, flags, filename);
      fclose(file);
    }
  }
}

void CompilingAnExpression(int argc, char* argv[], FILE* file, Flags flags,
                           char* filename) {
  regex_t regex;
  int resultCompil = 0;
  char errorMsgCompil[1000] = {0};
  char* pattern = NULL;
  if (argv[1][0] == '-' && (int)strlen(argv[1]) == 1) pattern = argv[1];
  if (argv[1][0] != '-') pattern = argv[1];
  if (argv[1][0] == '-' && argc >= 4 && (int)strlen(argv[1]) != 1)
    pattern = argv[2];
  if (argv[1][0] != '-' && argc >= 3 && (int)strlen(argv[1]) != 1)
    pattern = argv[1];

  int patternLenght = strlen(pattern);
  int cflags = 0;
  if (flags.E) cflags = REG_EXTENDED;
  if (flags.E && flags.V) cflags = 0;
  if (flags.I) cflags = REG_ICASE;
  resultCompil = regcomp(&regex, pattern, cflags);

  if (resultCompil) {
    regerror(resultCompil, &regex, errorMsgCompil, sizeof(errorMsgCompil));
    fprintf(stderr, "%s: %s\n", argv[0], errorMsgCompil);
  } else
    MatchSearch(argc, argv, file, flags, filename, &regex, patternLenght);
}

void MatchSearch(int argc, char* argv[], FILE* file, Flags flags,
                 char* filename, regex_t* regex, int patternLenght) {
  rewind(file);
  char* line = NULL;
  size_t len = 0;
  ssize_t read = 0;
  int countFile = CountFile(argc, argv);
  int countMatch = 0;
  int countNoMatch = 0;
  int countStr = 0;
  regmatch_t match[patternLenght];
  int countL = 0;
  while ((read = getline(&line, &len, file)) != -1) {
    countStr++;
    if (flags.O && !flags.C && !flags.L && !flags.V) {
      UsingTheFlagO(&flags, regex, line, countStr, countFile, filename);
      continue;
    }
    line[strcspn(line, "\n")] = 0;
    int errorRegexec = 0;
    if ((errorRegexec = regexec(regex, line, patternLenght, match, 0)) == 0) {
      countMatch++;
      OutputToTheLine(&flags, filename, countFile, countStr, &countL);
      if (!flags.O) PrintingMatches(&flags, match, line, countFile);
    } else if (errorRegexec > 1) {
      fprintf(stderr, "%s: error in the regexec function\n", argv[0]);
    } else if (errorRegexec == REG_NOMATCH && flags.V && !flags.O) {
      countNoMatch++;
      UsingTheFlagV(&flags, filename, countFile, countStr, line);
    }
  }
  UsingTheFlagC(&flags, filename, countFile, countMatch, countNoMatch);
  free(line);
  regfree(regex);
}

void PrintingMatches(Flags* flags, regmatch_t match[], char* line,
                     int countFile) {
  for (int i = 0; i < (int)strlen(line); i++) {
    if (i >= match[0].rm_so && i < match[0].rm_eo) {
      if (!flags->L && !flags->V && !flags->C) printf("%c", line[i]);
      if (i == (int)strlen(line) - 1 && !flags->C && !flags->V && !flags->L)
        printf("\n");
      continue;
    }
    OutputWhiteText(flags, line, countFile, i);
  }
}

void UsingTheFlagO(Flags* flags, regex_t* regex, char* line, int countStr,
                   int countFile, char* filename) {
  int newStart = 0;
  regmatch_t match;
  int matchRes = 0;
  while ((matchRes = regexec(regex, line + newStart, 1, &match, 0)) == 0) {
    for (int i = match.rm_so; i < match.rm_eo; i++) {
      if (countFile > 1 && !flags->H) printf("%s:", filename);
      if (flags->N) printf("%d:", countStr);
      printf("%c", line[i + newStart]);
    }
    printf("\n");
    newStart += match.rm_eo;
  }
}

//вывод чистого текста
void OutputWhiteText(Flags* flags, char* line, int countFile, int i) {
  if ((flags->E || flags->I || flags->H) && !flags->N && !flags->C &&
      !flags->L && !flags->O && !flags->V)
    printf("%c", line[i]);
  if (countFile >= 1 && flags->N && !flags->O && !flags->V && !flags->C)
    printf("%c", line[i]);
  if (i == (int)strlen(line) - 1 && !flags->C && !flags->V && !flags->L)
    printf("\n");
}

//вывод до строки
void OutputToTheLine(Flags* flags, char* filename, int countFile, int countStr,
                     int* countL) {
  if (flags->L && *countL == 0) {
    printf("%s\n", filename);
    *countL = *countL + 1;
  }
  if (countFile > 1 && (flags->E || flags->I || flags->O) && !flags->N &&
      !flags->C && !flags->L && !flags->V && !flags->H)
    printf("%s:", filename);
  if (countFile > 1 && flags->N && !flags->V && !flags->H && !flags->C)
    printf("%s:%d:", filename, countStr);
  if ((countFile == 1 && flags->N && !flags->C && !flags->V) ||
      (flags->H && flags->N && !flags->V))
    printf("%d:", countStr);
}

//\033[35m фиолетовый \033[36m бирюзовый \033[0m сброс

void UsingTheFlagV(Flags* flags, char* filename, int countFile, int countStr,
                   char* line) {
  static int countL = 0;
  if (flags->L && countL == 0) {
    printf("%s\n", filename);
    countL++;
  }
  if (flags->V && !flags->E && !flags->I && !flags->S && !flags->C &&
      !flags->L && !flags->N && !flags->H && !flags->O && countFile > 1)
    printf("%s:%s\n", filename, line);
  else if (flags->V && !flags->E && !flags->I && !flags->S && !flags->C &&
           !flags->L && !flags->N && !flags->H && !flags->O && countFile == 1)
    printf("%s\n", line);
  else if (flags->N && countFile == 1 && !flags->L)
    printf("%d:%s\n", countStr, line);
  else {
    if (flags->N && countFile > 1 && !flags->L)
      printf("%s:%d:%s\n", filename, countStr, line);
    else if (!(flags->N && countFile > 1) && !flags->S && !flags->E &&
             !flags->I && !flags->C && !flags->H && !flags->L)
      printf("%s\n", line);
    if (!flags->C && !flags->N && !flags->H && !flags->L && countFile > 1)
      printf("%s:%s\n", filename, line);
    else if (!flags->C && !flags->N && !flags->H && !flags->L && countFile == 1)
      printf("%s\n", line);
    if (!flags->C && !flags->N && flags->H && !flags->L) printf("%s\n", line);
  }
}

void UsingTheFlagC(Flags* flags, char* filename, int countFile, int countMatch,
                   int countNoMatch) {
  if (countFile > 1 && flags->C && !flags->V && !flags->L && !flags->H)
    printf("%s:%d\n", filename, countMatch);
  if (countFile == 1 && flags->C && !flags->V && !flags->L && !flags->H)
    printf("%d\n", countMatch);
  if (countFile == 1 && flags->C && flags->V) printf("%d\n", countNoMatch);
  if (countFile > 1 && flags->C && flags->V)
    printf("%s:%d\n", filename, countNoMatch);
  if (flags->C && flags->H) printf("%d\n", countMatch);
}

int CountFile(int argc, char* argv[]) {
  int countFile = 0;
  for (int i = 1; i < argc; i++) {
    if (i == 1 && argv[i][0] == '-' && i + 2 <= argc - 1) i += 2;
    if (argv[i][0] != '-' && i == 1 && i + 1 <= argc - 1) i++;
    countFile++;
  }
  return countFile;
}

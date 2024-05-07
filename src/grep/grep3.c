#include "grepFn.h"

int main(int argc, char* argv[]) {
  if (argc == 1)
    fprintf(stderr,
            "Usage: grep [OPTION]... PATTERNS [FILE]...\nTry 'grep --help' for "
            "more information.\n");
  else if (!CountArg(argc, argv) && SearchPattern(argc, argv)) {
    Flags flags = {false, false, false, false, false,
                   false, false, false, false, false};
    if (argv[1][0] == '-' && argv[1][1] == 'e')
      flags.E = true;
    else
      SearchFlags(argc, argv, &flags);
    PriorityOfFlags(&flags);
    if (!flags.unknown) ValidationCheckFile(argc, argv, flags);
  }
  return 0;
}

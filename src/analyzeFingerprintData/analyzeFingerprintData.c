// FILE: analyzeFingerprintData.c

#include <stdio.h>
#include <stdbool.h>
#include <string.h>

bool analyzeFingerprintData(const char *filename);
char *removeExtension(const char *filename);

void usage (char *executable) {
  fprintf(stderr, "USAGE: %s <filename>\n", executable);
}

int main (int argc, char *argv[]) {
  if (argc != 2) {
    usage(argv[0]);
    return -1;
  }

  char *filename = argv[1]; 
  fprintf(stdout, "INFO: Processing file '%s'\n", filename);

  bool success = analyzeFingerprintData(filename);

  if (success) {
    fprintf(stdout, "INFO: Authenticated fingerprint\n");
  } else {
    fprintf(stdout, "INFO: Fingerprint is unrecognized\n");
  } 
  return 0;
}

char *removeExtension(const char *filename) {
  size_t length = strlen(filename);
  char *basename;
  strcpy (basename, filename);
  while (basename[length-1] != '.' && length>0) {
    basename[length-1] = '\0';
    length--;
  }
  fprintf(stdout, "INFO: Returning basename=%s", basename);
  return basename;
}

bool analyzeFingerprintData(const char *filename) {
  
  FILE *inputFile;
  FILE *outputFile;

  char *basename = removeExtension(filename);
  char *outputFilename = strcat(basename, ".out");
  
  fprintf(stdout, "INFO: Output filename=%s", outputFilename);

  return 0;
}

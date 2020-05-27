#include <stdio.h>
/*
    comment
*/
#define FILE_PATH "./Grace_kid.c"
#define PROGRAM "#include <stdio.h>%2$c/*%2$c    comment%2$c*/%2$c#define FILE_PATH %3$c./Grace_kid.c%3$c%2$c#define PROGRAM %3$c%1$s%3$c%2$c#define MAIN() int main() {FILE *fp; fp = fopen(FILE_PATH, %3$cw+%3$c); if (fp != NULL ) {fprintf(fp, PROGRAM, PROGRAM, 10, 34);} fclose(fp); return(0);}%2$cMAIN();"
#define MAIN() int main() {FILE *fp; fp = fopen(FILE_PATH, "w+"); if (fp != NULL ) {fprintf(fp, PROGRAM, PROGRAM, 10, 34);} fclose(fp); return(0);}
MAIN();
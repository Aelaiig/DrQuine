#include <stdio.h>
#include <stdlib.h>

#define PROGRAM "#include <stdio.h>%2$c#include <stdlib.h>%2$c%2$c#define PROGRAM %3$c%1$s%3$c%2$c%2$cint main() {%2$c    int i = %5$i;%2$c    char *filePath = NULL;%2$c    char *fileName = NULL;%2$c    char *command = NULL;%2$c    char *executableName = NULL;%2$c    if (__FILE__ != %3$cSully.c%3$c) {i = i - 1;}%2$c    if (i > -1) {%2$c        asprintf(&filePath, %3$c./Sully_%4$ci.c%3$c, i);%2$c        asprintf(&fileName, %3$cSully_%4$ci.c%3$c, i);%2$c        asprintf(&executableName, %3$cSully_%4$ci%3$c, i);%2$c        FILE *fp;%2$c        fp = fopen(filePath, %3$cw+%3$c);%2$c        if (fp != NULL ) { fprintf(fp, PROGRAM, PROGRAM, 10, 34, 37, i); }%2$c        else { return(0); }%2$c        fclose(fp);%2$c        asprintf(&command, %3$cgcc -Wall -Wextra -Werror -o %4$c1$s %4$c2$s ; ./%4$c1$s%3$c, executableName, fileName);%2$c        system(command);%2$c    }%2$c    return(0);%2$c}"

int main() {
    int i = 5;
    char *filePath = NULL;
    char *fileName = NULL;
    char *command = NULL;
    char *executableName = NULL;
    if (__FILE__ != "Sully.c") {i = i - 1;}
    if (i > -1) {
        asprintf(&filePath, "./Sully_%i.c", i);
        asprintf(&fileName, "Sully_%i.c", i);
        asprintf(&executableName, "Sully_%i", i);
        FILE *fp;
        fp = fopen(filePath, "w+");
        if (fp != NULL ) { fprintf(fp, PROGRAM, PROGRAM, 10, 34, 37, i); }
        else { return(0); }
        fclose(fp);
        asprintf(&command, "gcc -Wall -Wextra -Werror -o %1$s %2$s ; ./%1$s", executableName, fileName);
        system(command);
    }
    return(0);
}
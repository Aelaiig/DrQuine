#include <stdio.h>
#include <string.h>
#include <stdlib.h>

#define PROGRAM "#include <stdio.h>%2$c#include <string.h>%2$c#include <stdlib.h>%2$c%2$c#define PROGRAM %3$c%1$s%3$c%2$c%2$cint main() {%2$c    int i = %5$i;%2$c    int j = i - 1;%2$c    char *filePath = NULL;%2$c    char *fileName = NULL;%2$c    char *command = NULL;%2$c    if (i > 0) {%2$c        asprintf(&filePath, %3$c./Sully_%4$ci.c%3$c, j);%2$c        asprintf(&fileName, %3$cSully_%4$ci.c%3$c, j);%2$c        FILE *fp;%2$c        fp = fopen(filePath, %3$cw+%3$c);%2$c        fprintf(fp, PROGRAM, PROGRAM, 10, 34, 37, j);%2$c        fclose(fp);%2$c        asprintf(&command, %3$cgcc -Wall -Wextra -Werror -o Sully %4$cs ; ./Sully%3$c, fileName);%2$c        system(command);%2$c    }%2$c    return(0);%2$c}"

int main() {
    int i = 5;
    int j = i - 1;
    char *filePath = NULL;
    char *fileName = NULL;
    char *command = NULL;
    if (i > 0) {
        asprintf(&filePath, "./Sully_%i.c", j);
        asprintf(&fileName, "Sully_%i.c", j);
        FILE *fp;
        fp = fopen(filePath, "w+");
        fprintf(fp, PROGRAM, PROGRAM, 10, 34, 37, j);
        fclose(fp);
        asprintf(&command, "gcc -Wall -Wextra -Werror -o Sully %s ; ./Sully", fileName);
        system(command);
    }
    return(0);
}
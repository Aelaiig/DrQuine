#include <stdio.h>

/*
    First comment
*/

void describeFile() {
    char *program = "#include <stdio.h>%2$c%2$c/*%2$c    First comment%2$c*/%2$c%2$cvoid describeFile() {%2$c    char *program = %3$c%1$s%3$c;%2$c    printf(program, program, 10, 34);%2$c}%2$c%2$cint main() {%2$c    /*%2$c        Second Comment%2$c    */%2$c    describeFile();%2$c    return(0);%2$c}";
    printf(program, program, 10, 34);
}

int main() {
    /*
        Second Comment
    */
    describeFile();
    return(0);
}
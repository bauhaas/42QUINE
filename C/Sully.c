
#include <stdio.h>
#include <stdlib.h>
int main()
{
    int i = 5;

    if (i <= 0)
        return 0;

    char str[] = "#include <stdio.h>%3$c#include <stdlib.h>%3$cint main()%3$c{%3$c%6$cint i = %2$d;%3$c%3$c%6$cif (i <= 0)%3$c%6$c%6$creturn 0;%3$c%3$c%6$cchar str[] = %4$c%1$s%4$c;%3$c%6$cchar fname[16];%3$c%6$csprintf(fname, %4$cSully_%5$cd.c%4$c, i - 1);%3$c%3$c%6$cFILE *file = fopen(fname, %4$cw%4$c);%3$c%6$cfprintf(file, str, str, i - 1, 10, 34, 37, 9);%3$c%6$cfclose(file);%3$c%3$c%6$cchar exec[64];%3$c%6$csprintf(exec, %4$cgcc -Wall -Wextra -Werror Sully_%5$c1$d.c -o Sully_%5$c1$d%4$c, i - 1);%3$c%6$csystem(exec);%3$c%6$csprintf(exec, %4$c./Sully_%5$cd%4$c, i - 1);%3$c%6$csystem(exec);%3$c}";
    char fname[16];
    sprintf(fname, "Sully_%d.c", i - 1);

    FILE *file = fopen(fname, "w");
    fprintf(file, str, str, i - 1, 10, 34, 37, 9);
    fclose(file);

    char exec[64];
    sprintf(exec, "gcc -Wall -Wextra -Werror Sully_%1$d.c -o Sully_%1$d", i - 1);
    system(exec);
    sprintf(exec, "./Sully_%d", i - 1);
    system(exec);
}
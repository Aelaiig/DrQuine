    global _main
    extern _fprintf
    extern _fopen
    extern _fclose

    section .text

%macro main 6
    _main:
        push    rbx

        createFile %1, %2

        writeFile %3, %4, %5, %6

        call    _fclose         ; rdi already initiate with fd

        pop     rbx
        ret
%endmacro

%macro createFile 2
    mov     rdi, file
    mov     rsi, status

    call    _fopen
%endmacro

%macro writeFile 4
    mov     rdi, rax
    mov     rsi, %1
    mov     rdx, %1
    mov     rcx, %2
    mov     r8, %3
    mov     r9, %4

    call    _fprintf
%endmacro

main file, status, format, arg1, arg2, arg3

    section .data
format:
    db      "    global _main%2$s    extern _fprintf%2$s    extern _fopen%2$s    extern _fclose%2$s%2$s    section .text%2$s%2$s%4$smacro main 6%2$s    _main:%2$s        push    rbx%2$s%2$s        createFile %4$s1, %4$s2%2$s%2$s        writeFile %4$s3, %4$s4, %4$s5, %4$s6%2$s%2$s        call    _fclose         ; rdi already initiate with fd%2$s%2$s        pop     rbx%2$s        ret%2$s%4$sendmacro%2$s%2$s%4$smacro createFile 2%2$s    mov     rdi, file%2$s    mov     rsi, status%2$s%2$s    call    _fopen%2$s%4$sendmacro%2$s%2$s%4$smacro writeFile 4%2$s    mov     rdi, rax%2$s    mov     rsi, %4$s1%2$s    mov     rdx, %4$s1%2$s    mov     rcx, %4$s2%2$s    mov     r8, %4$s3%2$s    mov     r9, %4$s4%2$s%2$s    call    _fprintf%2$s%4$sendmacro%2$s%2$smain file, status, format, arg1, arg2, arg3%2$s%2$s    section .data%2$sformat:%2$s    db      %3$s%1$s%3$s, 0%2$sarg1:%2$s    db      10, 0%2$sarg2:%2$s    db      34, 0%2$sarg3:%2$s    db      37, 0%2$sfile:%2$s    db      %3$sGrace_kid.s%3$s, 0%2$sstatus:%2$s    db      %3$sw+%3$s, 0", 0
arg1:
    db      10, 0
arg2:
    db      34, 0
arg3:
    db      37, 0
file:
    db      "Grace_kid.s", 0
status:
    db      "w+", 0
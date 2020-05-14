    ; MacOs program with C library
    global _main
    extern _printf

    section .text

_main:
    push    rbx                     ; Call stack must be aligned
_print:
    mov     rdi, format
    mov     rsi, format
    mov     rdx, arg1
    mov     rcx, arg2

    call    _printf

    pop     rbx
    ret

    section .data
format:
    db      "    ; MacOs program with C library%2$s    global _main%2$s    extern _printf%2$s%2$s    section .text%2$s%2$s_main:%2$s    push    rbx                     ; Call stack must be aligned%2$s_print:%2$s    mov     rdi, format%2$s    mov     rsi, format%2$s    mov     rdx, arg1%2$s    mov     rcx, arg2%2$s%2$s    call    _printf%2$s%2$s    pop     rbx%2$s    ret%2$s%2$s    section .data%2$sformat:%2$s    db      %3$s%1$s%3$s, 0%2$sarg1:%2$s    db      10, 0%2$sarg2:%2$s    db      34, 0", 0
arg1:
    db      10, 0
arg2:
    db      34, 0
    global  _main
    extern  _fprintf
    extern  _sprintf
    extern  _malloc
    extern  _fopen
    extern  _fclose
    extern  _system

    section .text
_main:
    push    rbx

    mov     rbx, 5

_if_checkFile:
    mov     rdi, fileSource
    mov     rsi, currentFile
    mov     rcx, currentFileLen + 1
    cld                                 ; put df to 0, needed for string instruction
    repe    cmpsb                       ;repeat until ecx = 0 compare byte address (e/r)di (e/r)si
    jecxz   _end_if_checkFile           ; jump if ecx = 0
_else_checkFile:
    dec     rbx
_end_if_checkFile:

_if_positif:
    cmp    rbx, -1
    jng    _end

_concatenate_file:
    mov     rdi, 19
    call    _malloc

    mov     r12, rax

    mov     rdi, r12
    mov     rsi, fileName
    mov     rdx, rbx
    call    _sprintf

    mov     rdi, 19
    call    _malloc

    mov     r13, rax

    mov     rdi, r13
    mov     rsi, fileObject
    mov     rdx, rbx
    call    _sprintf

    mov     rdi, 17
    call    _malloc

    mov     r14, rax

    mov     rdi, r14
    mov     rsi, executableName
    mov     rdx, rbx
    call    _sprintf

_createFile:
    mov     rdi, r12
    mov     rsi, status

    call    _fopen

    cmp     rax, 0
    je      _end
    mov     rbp, rax

    mov     rdi, rbp
    mov     rsi, format
    mov     rdx, format
    mov     rcx, arg1
    mov     r8, arg2
    mov     r9, rbx
    call    _fprintf

    mov     rdi, rbp
    call    _fclose

_concatenate_command:
    mov     rdi, 200
    call    _malloc

    mov     r15, rax

    mov     rdi, r15
    mov     rsi, command
    mov     rdx, r12
    mov     rcx, r13
    mov     r8, r14
    call    _sprintf

    mov     rdi, r15
    call    _system

_end:
    pop     rbx
    ret

        section .data
format:
    db      "    global  _main%2$s    extern  _fprintf%2$s    extern  _sprintf%2$s    extern  _malloc%2$s    extern  _fopen%2$s    extern  _fclose%2$s    extern  _system%2$s%2$s    section .text%2$s_main:%2$s    push    rbx%2$s%2$s    mov     rbx, %4$d%2$s%2$s_if_checkFile:%2$s    mov     rdi, fileSource%2$s    mov     rsi, currentFile%2$s    mov     rcx, currentFileLen + 1%2$s    cld                                 ; put df to 0, needed for string instruction%2$s    repe    cmpsb                       ;repeat until ecx = 0 compare byte address (e/r)di (e/r)si%2$s    jecxz   _end_if_checkFile           ; jump if ecx = 0%2$s_else_checkFile:%2$s    dec     rbx%2$s_end_if_checkFile:%2$s%2$s_if_positif:%2$s    cmp    rbx, -1%2$s    jng    _end%2$s%2$s_concatenate_file:%2$s    mov     rdi, 19%2$s    call    _malloc%2$s%2$s    mov     r12, rax%2$s%2$s    mov     rdi, r12%2$s    mov     rsi, fileName%2$s    mov     rdx, rbx%2$s    call    _sprintf%2$s%2$s    mov     rdi, 19%2$s    call    _malloc%2$s%2$s    mov     r13, rax%2$s%2$s    mov     rdi, r13%2$s    mov     rsi, fileObject%2$s    mov     rdx, rbx%2$s    call    _sprintf%2$s%2$s    mov     rdi, 17%2$s    call    _malloc%2$s%2$s    mov     r14, rax%2$s%2$s    mov     rdi, r14%2$s    mov     rsi, executableName%2$s    mov     rdx, rbx%2$s    call    _sprintf%2$s%2$s_createFile:%2$s    mov     rdi, r12%2$s    mov     rsi, status%2$s%2$s    call    _fopen%2$s%2$s    cmp     rax, 0%2$s    je      _end%2$s    mov     rbp, rax%2$s%2$s    mov     rdi, rbp%2$s    mov     rsi, format%2$s    mov     rdx, format%2$s    mov     rcx, arg1%2$s    mov     r8, arg2%2$s    mov     r9, rbx%2$s    call    _fprintf%2$s%2$s    mov     rdi, rbp%2$s    call    _fclose%2$s%2$s_concatenate_command:%2$s    mov     rdi, 200%2$s    call    _malloc%2$s%2$s    mov     r15, rax%2$s%2$s    mov     rdi, r15%2$s    mov     rsi, command%2$s    mov     rdx, r12%2$s    mov     rcx, r13%2$s    mov     r8, r14%2$s    call    _sprintf%2$s%2$s    mov     rdi, r15%2$s    call    _system%2$s%2$s_end:%2$s    pop     rbx%2$s    ret%2$s%2$s        section .data%2$sformat:%2$s    db      %3$s%1$s%3$s, 0%2$sarg1:%2$s    db      10, 0%2$sarg2:%2$s    db      34, 0%2$sfileName:%2$s    db      %3$sSully_%%d.s%3$s, 0%2$sfileObject:%2$s    db      %3$sSully_%%d.o%3$s, 0%2$sexecutableName:%2$s    db      %3$sSully_%%d%3$s, 0%2$sstatus:%2$s    db      %3$sw+%3$s, 0%2$scommand:%2$s    db      %3$snasm -f macho64 %%1$s; ld -macosx_version_min 14.6.0 -lSystem -no_pie -o %%3$s %%2$s; rm %%2$s; ./%%3$s%3$s, 0%2$sfileSource:%2$s    db      %3$sSully.s%3$s, 0%2$scurrentFile:%2$s    db      __FILE__, 0%2$scurrentFileLen: equ     $-currentFile", 0
arg1:
    db      10, 0
arg2:
    db      34, 0
fileName:
    db      "Sully_%d.s", 0
fileObject:
    db      "Sully_%d.o", 0
executableName:
    db      "Sully_%d", 0
status:
    db      "w+", 0
command:
    db      "nasm -f macho64 %1$s; ld -macosx_version_min 14.6.0 -lSystem -no_pie -o %3$s %2$s; rm %2$s; ./%3$s", 0
fileSource:
    db      "Sully.s", 0
currentFile:
    db      __FILE__, 0
currentFileLen: equ     $-currentFile
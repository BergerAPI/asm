section .text

extern printf

global main

str: db 'Ttuna %i', 0xa, 0

main:
    mov rax, 0
    mov rbx, 0

    mov qword [index], 0

loop:
    cmp qword [index], 7
    jg exit

    mov rdi, str
    mov rsi, qword [index]

    call printf
    xor rax, rax

    add qword [index], 1

    jmp loop

exit:
    ret

section .bss
    index: resd 16

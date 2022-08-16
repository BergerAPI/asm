section .text

extern printf

global main

str: db "Hello World !!!", 0xA, 0

%macro setup 0
    xor rax, rax
    xor rbx, rbx
%endmacro

%macro exit 1
    mov eax, %1
    ret
%endmacro

%macro print 1
    mov rdi, %1
    xor rax, rax
    call printf
%endmacro

main:
    setup

    print str

    exit 12

section .bss
    test: resb 16
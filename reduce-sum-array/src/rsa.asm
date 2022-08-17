section .data
fmt: db "%i", 0xA, 0

section .text
extern printf
global main

main:
    xor rax, rax
    xor rbx, rbx

    mov dword [arr + 0 * 4], 0
    mov dword [arr + 1 * 4], 1
    mov dword [arr + 2 * 4], 2
    mov dword [arr + 3 * 4], 3
    mov dword [arr + 4 * 4], 4
    mov dword [arr + 5 * 4], 5

    mov dword [v], 5
    mov dword [i], 0
    mov dword [c], 0

    jmp loop
loop:
    mov edx, dword [v]
    cmp dword [i], edx
    ja exit

    mov edi, dword [i]
    mov edx, dword [arr + edi * 4]
    add dword [c], edx

    inc dword [i]
    jmp loop

exit:
    xor rax, rax
    mov rdi, fmt
    mov rsi, qword [c]
    call printf

    mov eax, 0
    ret

section .bss
    arr: resd 16
    v: resd 1
    c: resd 1
    i: resd 1
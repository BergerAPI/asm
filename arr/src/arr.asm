; Written by Niclas Berger <admin@bergerapi.dev> Mo 15. Aug 2022

; Assemble      nasm -f elf64 src/arr.asm -o asm.o
; Link          gcc -m64 -no-pie -o j asm.o
; Run           ./j

; Equivalent C code
; // arr.c
; #include <stdio.h>
; int main() {
;     char arr[] = {'D', 'e', 'e', 'z', 'N', 'u', 't', 's'};
;     for (int index = 0; index < 8; index++)
;         printf("%c", arr[index]);
;     printf("\n");
;     return 0;
; }

section .text

extern printf

global main

str: db '%c', 0                                    ; The format to print the characters
nl: db 0xa, 0                                       ; Just stores a new-line character

main:
    mov rax, 0                                      ; Aligning the Stack
    mov rbx, 0                                      ; Aligning the Stack

    ;         base + index * scale
    mov byte [arr + 0 * 1], 'D'                     ; Filling the array
    mov byte [arr + 1 * 1], 'e'                     ; Filling the array
    mov byte [arr + 2 * 1], 'e'                     ; Filling the array
    mov byte [arr + 3 * 1], 'z'                     ; Filling the array

    mov byte [arr + 4 * 1], 'N'                     ; Filling the array
    mov byte [arr + 5 * 1], 'u'                     ; Filling the array
    mov byte [arr + 6 * 1], 't'                     ; Filling the array
    mov byte [arr + 7 * 1], 's'                     ; Filling the array

    mov dword [index], 0                            ; Setting the index-reserved-space (variable) to 0

loop:
    cmp dword [index], 7                            ; Comparing the index to 7
    jg exit                                         ; Checking whether the index is greater than 7, if yes, jump to exit

    mov rdi, str                                    ; Setting the first parameter to the format string

    mov ebx, [index]                                ; Storing the index in the ebx-register to do array-access
    mov rsi, qword [arr + ebx * 1]                  ; Accessing the array (arr-reserved-space) and setting the value to the second parameter

    call printf                                     ; Calling printf, to print the character with the format given
    xor rax, rax                                    ; Clearing the accumulator

    add dword [index], 1                            ; Increasing the index by one, to not end in an endless loop

    jmp loop                                        ; Jumping to loop

exit:
    xor rax, rax                                    ; Clearing the accumulator once again
    mov rdi, nl                                     ; Setting the firs parameter to the new line character
    call printf                                     ; Calling printf

    mov     eax, 0

    ret                                             ; Returning from the program with the exit-code 0 (SUCCESS)

section .bss
    index: resd 16                                  ; Reserving space for index (16 double-words)
    arr: resb 16                                    ; Reserving space for the array (16 bytes)

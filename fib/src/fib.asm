; Explanation of Fibonacci: https://www.geeksforgeeks.org/c-program-for-fibonacci-numbers/
; This code uses the dynamic programming approach

; Equivalent C code
; // fib.c
; #include <stdio.h>
; #include <stdint.h>
; int main()
; {
;     int32_t n = 15;
;     int32_t f[64];
;
;     f[0] = 0;
;     f[1] = 1;
;
;     for (int32_t i = 2; i <= n; i++)
;         f[i] = f[i - 1] + f[i - 2];
;
;     printf("Fibonacci Number %i is %i \n", n, f[n]);
;     return 0;
; }

section .text
extern printf
global main

result: db "Fibonacci Number %i is %i", 0xA, 0

main:
	xor rax, rax
	xor rbx, rbx
	mov dword [idx], 2
	mov dword [val], 15
	mov dword [arr + 0 * 4], 0
	mov dword [arr + 1 * 4], 1
	jmp loop
loop:
	mov eax, dword [val]
	cmp dword [idx], eax
	ja exit
	mov edx, dword [idx]
	sub edx, 1
	mov edi, dword [arr + edx * 4]
	mov edx, dword [idx]
	sub edx, 2
	mov eax, dword [arr + edx * 4]
	mov edx, dword [idx]
	add eax, edi
	mov dword [arr + edx * 4], eax
                
	inc dword [idx]
	jmp loop

exit:
	mov edx, dword [val]
	xor rax, rax
	mov rdi, result
	mov rsi, qword [val]
	mov rdx, qword [arr + edx * 4]
	call printf
	mov eax, 0
	ret

section .bss
	idx: resd 1
	arr: resd 64
	val: resd 1
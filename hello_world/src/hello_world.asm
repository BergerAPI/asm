section .text                               ; Entering the text-section (this is where to write code)

extern printf                               ; Using the c-function "printf

global main                                 ; Defining the entry point

str: db "Hello World !!!", 0                ; Defining the hello-world string

main:
    mov rax, 0                              ; Aligning the stack (clearing the accumulator)
    mov rbx, 0                              ; Aligning the stack

    mov rdi, str                            ; Moving the hello-world string into the rdi register, since it acts as first parameter for a c-function
    call printf                             ; Calling the c-function "printf"
    xor rax, rax                            ; Clearing rax, which acts as accumulator

    ret                                     ; Returning with a 0-status (SUCCESS)
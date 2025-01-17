extern strlen

section .data
    msg db "error argument needed", 10, 0
    ndl db 10, 0

section .text
    global _start

_start:
    mov rax, 1
    mov rdi, 1
    mov rsi, msg
    mov rdx, 22
    syscall
    mov rax, 60
    mov rdi, 25
    syscall

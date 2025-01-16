section .data
    msg db "error argument needed", 10, 10, 0
    ndl db 10, 0

section .bss
    len resq 1           ; Reserve space for string length

section .text
    extern strlen
    global _start

_start:
    call main

    mov rax, 60         ; sys_exit
    xor rdi, rdi        ; exit(0)
    syscall

ft_putstr:
    mov rax, 1
    mov rdi, 1
    syscall
    ret

main:
    mov rdi, rsi
    cmp rdi, 2
    jl error

    mov rsi, rdx
    call strlen
    mov rdx, rax
    mov rsi, rdx
    call ft_putstr
    mov rsi, ndl
    mov rdx, 1
    jmp end_main

error:
    mov rsi, msg
    mov rdx, 23
    call ft_putstr

end_main:
    ret

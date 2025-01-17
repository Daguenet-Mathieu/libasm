section .data
    msg db "error argument needed", 10, 0
    ndl db 10, 0

section .text
    extern strlen
    global _start

_start:
    mov rdi, [rsp]
    cmp rdi, 2
    jl error

    mov rdi, [rsp+16]
    call strlen
    mov rdx, rax
    mov rsi, [rsp+16]
    mov byte [rdi + 3], 'X'
    call ft_putstr
    mov rsi, ndl
    mov rdx, 1
    call ft_putstr
    jmp exit

error:
    mov rsi, msg
    mov rdx, 22
    call ft_putstr
    jmp exit

exit:
    mov rax, 60
    xor rdi, rdi
    syscall

ft_putstr:
    mov rax, 1
    mov rdi, 1
    syscall
    ret

ft_put:
    call strlen
    mov rdx, rax
    mov byte [rsi + rdx], 10
    inc rdx
    mov rax, 1
    mov rdi, 1
    syscall
    mov byte [rsi + rdx - 1], 0
    ret


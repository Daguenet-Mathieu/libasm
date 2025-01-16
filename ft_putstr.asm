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
    mov rax, 1
    mov rdi, 1
    call strlen
    mov byte [rdi + rax], 10
    syscall
    ret

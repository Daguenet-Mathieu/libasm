extern puts

section .data
    msg db 72, 101, 108, 108, 111, 10, 0 ;"coucou" ,10, 0 ;db = define byte

section .text
    global _start
    global main

_start:
    call main
    mov eax, 1            ; Syscall number for exit
    xor ebx, ebx          ; Exit status 0
    int 0x80              ; Make syscall

main:
    push ebp
    mov ebp, esp
    push ebx
    push esi
    push edi

    push dword msg
    call puts

    ;pop edi
    ;pop esi
    ;pop ebx
    ;mov esp, ebp
    ;pop ebp
    ret

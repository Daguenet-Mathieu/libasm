extern printf

section .data
    msg db "argc : %d", 10, 0 ;

section .text
    global _start
    global main

_start:
    call main
    mov eax, 1           
    xor ebx, ebx         
    int 0x80              

main:
    push ebp
    mov ebp, esp
    push ebx
    push esi
    push edi

    mov eax, [ebp+8]
    push eax    

    push dword msg
    call printf

    pop edi
    pop esi
    pop ebx
    mov esp, ebp
    pop ebp
    ret

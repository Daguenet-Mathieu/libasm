section .data
    errormsg db "error argument needed", 10, 0  ; Message d'erreur
    successmsg db "success", 10, 0               ; Message de succès
    errormsg_len equ $ - errormsg                ; Longueur du message d'erreur
    successmsg_len equ $ - successmsg            ; Longueur du message de succès

section .text
    global _start

_start:
    cmp dword [rsp], 2        ; Vérifier si argc >= 2
    jl error                  ; Si argc < 2, afficher le message d'erreur

    mov rdi, [rsp + 16]       ; Charger argv[1] dans rdi (1er argument utilisateur)
    call ft_strlen            ; Appeler la fonction ft_strlen, la longueur sera dans rax

end_program:
    mov rdi, rax             ; Placer la longueur de la chaîne dans rdi (code de retour)
    mov rax, 60              ; syscall exit
    syscall

ft_strlen:
    mov rax, 0               ; Initialiser compteur de longueur à 0
    loop_start:
        cmp byte [rdi + rax], 0  ; Comparer avec 0 (fin de chaîne)
        je end_loop              ; Si c'est la fin de la chaîne, on retourne directement avec la longueur
        inc rax                  ; Incrémenter le compteur
        jmp loop_start           ; Recommencer la boucle

end_loop:
    ret

error:
    mov rax, 1               ; Appel système write (affichage du message d'erreur)
    mov rdi, 1               ; STDOUT
    mov rsi, errormsg        ; Adresse du message d'erreur
    mov rdx, errormsg_len    ; Taille du message d'erreur
    syscall

    mov rax, 60              ; Appel système exit
    mov rdi, 1               ; Code de sortie 1 (erreur)
    syscall

section .data
    is db "Isoceles", 0ah
    eq db "Equilatero", 0ah
    esc db "Escaleno", 0ah
    a dq 1
    b dq 2
    c dq 1
    
section .text
    global _start

compare:
    ; the data must be in r8, r9, r10 (a, b, c)

    cmp r8, r9
    je .isoceles
    cmp r9, r10
    je .isoceles_
    cmp r8, r10
    je .isoceles_
    jne .escaleno
    
    .isoceles:
        cmp r9, r10
        je .equilatero
        
        mov rax, 1
        mov rdi, 1
        mov rsi, is
        mov rdx, 8
        syscall
        ret
    
        .equilatero:

            mov rax, 1
            mov rdi, 1
            mov rsi, eq
            mov rdx, 10
            syscall
            ret
            
    .isoceles_:
        mov rax, 1
        mov rdi, 1
        mov rsi, is
        mov rdx, 8
        syscall
        ret
    
    .escaleno:
        mov rax, 1
        mov rdi, 1
        mov rsi, esc
        mov rdx, 8
        syscall
        ret
    
_start:

    ;mov rax, 0
    ;mov rdi, 0
    ;mov rsi, a
    ;mov rdx, 8
    ;syscall
    
    ;mov rax, 0
    ;mov rdi, 0
    ;mov rsi, b
    ;mov rdx, 8
    ;syscall
    
    ;mov rax, 0
    ;mov rdi, 0
    ;mov rsi, c
    ;mov rdx, 8
    ;syscall
    
    mov r8, [a]
    mov r9, [b]
    mov r10, [c]
    call compare
    
    mov rax, 60
    mov rdi, 0
    syscall

section .data

msg: db "IMPAR",0

par: db "Par",0

impar: db "Ímpar",0

section .text

strlen:     
    mov  rax, 0    
    
    .loop:        
        cmp byte [rdi+rax],0        
        je .end
        inc rax
        jmp .loop    
    .end:
        sub rax, rdi
        ret
        
div_rest:
    ;rdx é o resto
    ;rdi/rax tá o tamanho da nossa palavra
    
    and rax, 1
    cmp rax, 0
    je .par
    jne .impar
    
    .par:
        mov rax, 1              ; Código da syscall 'write'
        mov rdi, 1              ; Descritor de arquivo para a saída padrão (stdout)
        mov rsi, par            ; Endereço da variável result
        mov rdx, 3              ; Tamanho do resultado (1 byte)
        syscall                 ; Chamar a syscall 'write'
        
        jmp .end
    
    .impar:
        mov rax, 1              ; Código da syscall 'write'
        mov rdi, 1              ; Descritor de arquivo para a saída padrão (stdout)
        mov rsi, impar          ; Endereço da variável result
        mov rdx, 6              ; Tamanho do resultado (1 byte)
        syscall                 ; Chamar a syscall 'write'
        
        jmp .end
        
    .end:
        ret
            
global _start
_start:         
    mov rdi, msg
    call strlen
    call div_rest
    
    mov rax, 60        
    syscall

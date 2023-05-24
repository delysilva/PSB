section .data

array db 2, 5, 6, 7, 0

var db 8

nfound db "O valor não está no array", 10

yfound db "O valor está no array", 10

section .text

search:
    mov rax, 0
    mov rcx, 0 ; contador de elementos
    .loop:
        
        cmp byte [rdi+rax], dl ; dl são os primeiros 8 bits do registrador rdx
        je .found
        cmp byte [rdi+rax], 0 ; verifica se chegou ao fim do array
        je .notfound
        inc rax
        inc rcx
        jmp .loop
        
        .notfound:
            mov rax, 1 ; código da syscall 'write'
            mov rdi, 1 ; descritor de arquivo para a saída padrão (stdout)
            mov rsi, nfound ; endereço da variável result
            mov rdx, 27 ; tamanho do resultado (27 bytes)
            syscall ; chamar a syscall 'write'
            
            jmp .exit
        
        .found:
            mov rax, 1 ; código da syscall 'write'
            mov rdi, 1 ; descritor de arquivo para a saída padrão (stdout)
            mov rsi, yfound ; endereço da variável result
            mov rdx, 22 ; tamanho do resultado (22 bytes)
            syscall ; chamar a syscall 'write'
           
            jmp .exit
        
        .exit:
            ret

global _start

_start:
    mov rdi, array
    mov rdx, var
    call search
    
    mov rax, 60        
    syscall

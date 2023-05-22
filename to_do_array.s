section .data

array db 2,1,5,6,7

var db 2

section .text

strlen:     
    mov  rax, 0    
    
    .loop:        
        cmp byte [rdi+rax], 0
        je .notfound
        cmp byte [rdi+rax],var
        je .found
        inc rax
        jmp .loop    
    .notfound:

        
    .found:
        
global _start
_start:         
    mov rdi, array
    call strlen
    call div_rest
    
    mov rax, 60        
    syscall

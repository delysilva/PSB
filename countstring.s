section .data
    ans dq 0

section .bss
    letra resb 256

section .text
    global _start

_start:
    mov rax, 0              ; Código da syscall 'read'
    mov rdi, 0              ; Descritor de arquivo para a entrada padrão
    mov rsi, letra         ; Endereço da variável 
    mov rdx, 256              ; Tamanho do resultado (256 byte)
    syscall                 ; Chamar a syscall 'read'

    call _count

    xor rdi, rdi            ; Código de saída 0
    mov eax, 60             ; Código da syscall 'exit'
    xor rdx, rdx            ; Argumento zero para syscall de saída
    syscall                 ; Chamar a syscall de saída
    

_count:
    mov rax, [letra]	; Get char from var
    add ans 1


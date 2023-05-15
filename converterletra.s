section .data
    num1 dq 32      ; Primeiro número
    result db 0      ; Variável para armazenar o resultado

section .bss
    letra resb 1

section .text
    global _start

_start:
    mov rax, 0              ; Código da syscall 'write'
    mov rdi, 0              ; Descritor de arquivo para a saída padrão (stdout)
    mov rsi, letra         ; Endereço da variável result
    mov rdx, 1              ; Tamanho do resultado (1 byte)
    syscall                 ; Chamar a syscall 'write'

    mov rax, qword [num1]   ; Carrega o primeiro número em rax
    mov rbx, [letra]
    add rax, rbx   ; Adiciona o segundo número a rax
    mov byte [result], al   ; Armazena o resultado em result como um byte

    mov rax, 1              ; Código da syscall 'write'
    mov rdi, 1              ; Descritor de arquivo para a saída padrão (stdout)
    mov rsi, result         ; Endereço da variável result
    mov rdx, 1              ; Tamanho do resultado (1 byte)
    syscall                 ; Chamar a syscall 'write'
    
    xor rdi, rdi            ; Código de saída 0
    mov eax, 60             ; Código da syscall 'exit'
    xor rdx, rdx            ; Argumento zero para syscall de saída
    syscall                 ; Chamar a syscall de saída

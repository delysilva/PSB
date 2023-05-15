section .data
    num1 dq 35      ; Primeiro número
    num2 dq 40       ; Segundo número
    result db 0      ; Variável para armazenar o resultado

section .text
    global _start

_start:
    mov rax, qword [num1]   ; Carrega o primeiro número em rax
    add rax, qword [num2]   ; Adiciona o segundo número a rax
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


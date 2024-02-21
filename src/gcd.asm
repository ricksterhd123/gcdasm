%include "test.inc"

section .text
global _start

gcd:
    push ebp

    mov eax, [esp + 4]
    mov ebx, [esp + 8]

    test eax, eax
    je .gcd_zero

    ; swap eax and ebx
    mov ecx, eax
    mov eax, ebx
    mov ebx, ecx
    
    ; clear registers ecx, edx
    xor ecx, ecx ; used in the swap
    xor edx, edx ; remainder from div

    div ebx  ; eax = eax / ebx, edx = eax % ebx

    push ebx ; a
    push edx ; b % a

    add esp, 8
    call gcd ; gcd(b % a, a)
    pop eax
    ret

.gcd_zero:
    mov eax, 0
    ret

_start:
    ; Push arguments onto the stack
    push 10
    push 5

    call test

    ; Call the subroutine
    call gcd

    ; Clean up the stack
    add esp, 4   ; 4 bytes for local variables + 4 bytes for 2 arguments

    ; Exit the program
    mov eax, 1
    xor ebx, ebx
    int 0x80

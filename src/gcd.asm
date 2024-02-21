%include "utils.asm"

section .text
global _start

gcd:
    push ebp
    mov ebp, esp

    mov eax, [esp + 8]
    mov ebx, [esp + 12]

    cmp ebx, 0
    jle .gcd_zero

    xor edx, edx ; remainder from div
    div ebx  ; eax = eax / ebx, edx = eax % ebx

    push edx ; a % b
    push ebx ; b

    call gcd ; gcd(b, a % b)

.gcd_zero:
    pop ebp
    ret 8

_start:
    ; Push arguments onto the stack
    push 50120  ; b
    push 120    ; a

    call gcd ; r = gcd(a, b)
    call iprintLF ; iprintLF(r)

    ; Exit the program
    mov eax, 1
    xor ebx, ebx
    int 0x80

%include "utils.inc"
%include "gcd.inc"

section .text
global _start

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

section .text
global gcd

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

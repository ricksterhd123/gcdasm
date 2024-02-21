# gcdasm

GCD implementation in x86 assembly using nasm

## Prerequisites
- GNU/Linux x86 with bash
- build tools (make, ld)
- gcc-multilib
- nasm

## Run
- Run `make && ./gcd`

## Notes
### Debugging with gdb
Compile and run `gdb ./gcd`

- `list` (list asm, -g set on nasm/ld for debugging)
- `break [line-number]` (set breakpoint)
- `run` (run program)
- `info registers` (list registers)
- `continue` (continue after breakpoint)
- `quit` or `exit`

### Recursion in x86

Setting up recursive function in nasm

```asm
recursive_counter:
    push ebp
    mov ebp, esp

    mov eax, [ebp + 8]

    cmp eax, 0
    jle .base_case

    dec eax
    push eax

    call recursive_counter

.base_case
    pop ebp
    ret 4
```

#### Registers
- `eax`, `ebx`, `ecx`, `edx` are 32 bit general purpose registers
- `esp` - stack pointer
- `ebp` - stack base pointer

#### How it works
- Setup stack frame with `push ebp`, `mov ebp, esp`
- Fetch arguments 1, 2, ... n using `mov eax, [ebp + 4 + (n * 4)]
- if `eax` is 0, jump to `.base_case`
- otherwise
    - decrement `eax` by 1
    - push `eax` on stack as first argument of call
    - call recursive_counter (...)
- `pop ebp`, this restores the old ebp before we call `ret`
- `ret [n]` where n is the total number bytes of arguments before return address

## Reference
- `utils.asm` https://asmtutor.com/#lesson3

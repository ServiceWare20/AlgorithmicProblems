section .text
global main
extern printf
extern get_nano

; a: Implement `int pow(int a, int b)` which returns
; `a` at power of `b`.

pow:
    push ebp
    mov ebp, esp
    mov ecx, [ebp+12]
    mov eax, [ebp+8]
    mov ebx, eax
    xor edx, edx

    cmp ecx, 0
    je return1

    dec ecx
    je done

loop:
    imul ebx
    dec ecx
    jne loop

done:
    leave
    ret
return1:
    mov eax, 1
    leave
    ret

; b: Implement RECURSIVELY `int pow_rec(int a, int b)`
; which returns `a` at power of `b`.

pow_rec:
    push ebp
    mov ebp, esp
    push ebx

    mov eax, [ebp+8]
    mov ebx, [ebp+12]

    cmp ebx, 1
    je return_
    cmp ebx, 0
    je return1_

    test bl, 1
    jz even

    ; caz impar - trebuie sa apelam pow_rec(a, b-1) apoi sa inmultim cu a
    ; pastram valoarea veche a lui a
    push eax
    dec ebx

    push ebx
    push eax
    call pow_rec
    add esp, 8

    ; inmultim cu a
    pop ebx
    imul ebx

    pop ebx
    leave
    ret

even:
    ; caz par - trebuie sa apelam pow_rec(a, b/2) apoi sa obtinem patratul
    shr ebx, 1

    push ebx
    push eax
    call pow_rec
    add esp, 8

    mov ebx, eax
    imul ebx

return_:
    pop ebx
    leave
    ret

return1_:
    mov eax, 1
    pop ebx
    leave
    ret


main:
    push ebp
    mov ebp, esp

    ; a: Call `pow` using 3 for `a` and 4 for `b`.
    ; NOTE: You must print the result.
    push dword 4 ; b
    push dword 3 ; a
    call pow
    add esp, 8

    push eax
    push dword messageA
    call printf
    add esp, 8


    ; b: Call `pow_rec` using 3 for `a` and 4 for `b`.
    ; NOTE: You must print the result.
    push dword 4 ; b
    push dword 3 ; a
    call pow_rec
    add esp, 8

    push eax
    push dword messageB
    call printf
    add esp, 8

    ; TODO c: Call `get_nano()` for each of the functions above
    ; in order to get the number of nanoseconds each one of them
    ; took to run.
    ; NOTE: You must print the name of the function that took
    ; less seconds to run.
    sub esp, 8

    call get_nano
    mov [esp],eax

    push dword 4
    push dword 3
    call pow
    add esp, 8

    call get_nano
    mov [esp+4],eax

    push dword 4
    push dword 3
    call pow_rec
    add esp, 8

    call get_nano
    sub eax, [esp+4]
    mov ecx, eax
    ;ecx are durata de timp in care s-a executat pow_rec

    mov eax, [esp+4]
    sub eax, [esp+0]
    ;eax are durata de timp in care s-a executat pow

    cmp eax, ecx
    jg powrecwins
    push messageWinA
    jmp doprint
powrecwins:
    push messageWinB
doprint:
    call printf
    add esp, 4

    ; Return 0.
    xor eax, eax
    add esp, 8
    leave
    ret

section .rodata
messageA: db `a) %d\n\x0`
messageB: db `b) %d\n\x0`
messageWinA: db `c) Non-recursive pow wins\n\x0`
messageWinB: db `c) Recursive pow wins\n\x0`

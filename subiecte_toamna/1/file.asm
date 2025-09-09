%include "printf32.asm"

section .rodata
    weird: db "byteme", 10, 0


section .text
extern printf
global main

main:
    push ebp
    mov ebp, esp


    ; TODO a: Determine whether the signed integer saved at the
    ; middle of the `weird` array is positive.
    ; NOTE: You must print "The number <nr> is positive" if nr
    ; is higher that 0, or "The number <nr> is negative", otherwise.



    ; TODO b: Determine whether the signed quad word
    ; represented by the `weird` array is odd or even.
    ; NOTE: You must print "The number <nr> is odd" if nr
    ; is odd, or "The number <nr> is even", otherwise.



    ; TODO c: Determine the number of set bits inside the
    ; `weird` array.
    ; NOTE: You must print the result.



    ; Return 0.
    xor eax, eax
    leave
    ret

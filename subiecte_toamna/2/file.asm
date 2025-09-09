section .text
global main

; TODO a: Implement `int pow(int a, int b)` which returns
; `a` at power of `b`.

pow:
    push ebp
    mov ebp, esp

    leave
    ret

; TODO b: Implement RECURSIVELY `int pow_rec(int a, int b)`
; which returns `a` at power of `b`.

pow_rec:
    push ebp
    mov ebp, esp

    leave
    ret


main:
    push ebp
    mov ebp, esp


    ; TODO a: Call `pow` using 3 for `a` and 4 for `b`.
    ; NOTE: You must print the result.



    ; TODO b: Call `pow_rec` using 3 for `a` and 4 for `b`.
    ; NOTE: You must print the result.



    ; TODO c: Call `get_nano()` for each of the functions above
    ; in order to get the number of nanoseconds each one of them
    ; took to run.
    ; NOTE: You must print the name of the function that took
    ; less seconds to run.



    ; Return 0.
    xor eax, eax
    leave
    ret

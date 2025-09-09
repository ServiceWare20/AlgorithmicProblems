%include "printf32.asm"

section .rodata
    weird: db "byteme", 10, 0


section .text
extern printf
global main

main:
    push ebp
    mov ebp, esp


    ; a: Determine whether the signed integer saved at the
    ; middle of the `weird` array is positive.
    ; NOTE: You must print "The number <nr> is positive" if nr
    ; is higher that 0, or "The number <nr> is negative", otherwise.
	mov eax, [weird+2]
	cmp eax, 0
	jl  negative
	
	PRINTF32 "The number %d is positive\n", eax
	jmp done
	
negative:
	PRINTF32 "The number %d is negative\n", eax
	
done:
    ; b: Determine whether the signed quad word
    ; represented by the `weird` array is odd or even.
    ; NOTE: You must print "The number <nr> is odd" if nr
    ; is odd, or "The number <nr> is even", otherwise.
	
	; doar trebuie verificat primul bit
	mov eax, [weird]
	mov ecx, [weird+4]
	test al, 1
	jz   par
	
	PRINTF32 "The number %lld is even\n", ecx, eax
	jmp done2
	
par:
	PRINTF32 "The number %lld is odd\n", ecx, eax
	
done2:
    ; c: Determine the number of set bits inside the
    ; `weird` array.
    ; NOTE: You must print the result.
	popcnt ebx, eax
	popcnt edx, ecx
	add ebx, edx
	PRINTF32 "Number of set bits: %d\n", ebx
	
	; d: print the address of first main() instruction
	mov eax, main
	PRINTF32 "Address of first main instruction: %p\n", eax

    ; Return 0.
    xor eax, eax
    leave
    ret

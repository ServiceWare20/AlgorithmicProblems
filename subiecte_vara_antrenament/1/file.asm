%include "printf32.asm"

section .data
    zeros dw 0b0010110100010000
    vec db 'vybirnffrzoyl', 0
    len_vec equ $ - vec

    struc endianess
        ; TODO: c) Declare the fields of the structure
        ;          "big" - for big-endian binary string representation
        ;          "little" - for little-endian binary string representation
    endstruc

section .bss
    ; TODO: d) Declare a variable "endianness_vec" of type "endianess"


section .text
extern printf
global main

main:
    push ebp
    mov ebp, esp

    ; TODO: a) Count the number of trailing zero bits in "zeros"
solve:
    ; Initialize counter in ecx
    xor ecx, ecx
    
    ; Load zeros
    mov ax, [zeros]
    
count_loop:
    ; Test the least significant bit
    test ax, 1
    
    ; If bit is 1, stop
    jnz print_result
    
    ; If bit is 0, increment counter and shift right
    inc ecx
    shr ax, 1
    jmp count_loop

print_result:
    PRINTF32 `Number of trailing zeros: %d\n\x0`, ecx

    ; b) Perform ROT13 on the string "vec"
	mov ecx, 0
loop:
	mov al, [zeros + ecx]
	add al, 13
	cmp al, 'z'
	jle skip
	sub al, 26
skip:
	mov [zeros + ecx], al
	
	inc ecx
	cmp ecx, len_vec
	jne loop
	
	PRINTF32 

    ; TODO: c) Print the size of the "endianess" structure (bits and bytes)

    ; TODO: d) Print the string "vec" in big-endian and little-endian formats
    ;          Store the results in the "endianness_vec" structure

    ; Return 0
    xor eax, eax
    leave
    ret

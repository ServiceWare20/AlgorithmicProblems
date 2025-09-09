section .data
newline db 10, 0
fmt_int db "%d ", 0

section .text
extern malloc
extern printf
global main

; TODO: b) Create a linear congruential generator (LCG) init function
;          Initializes the LCG with parameters a, b and m.

; TODO: c) Create a linear congruential generator (LCG) next function
;          Returns the next random number in the sequence.

; TODO: d) Create the map function
;          Takes a pointer to the buffer and a function pointer,
;          applies the function to each element in the buffer.


main:
    push ebp
    mov ebp, esp

    ; Part a) Allocate and initialize buffer
    push 200            
    call malloc
    add esp, 4  
    mov esi, eax
    
    ; Initialize buffer
    xor ecx, ecx
init_loop:
    mov [esi + ecx*4], ecx 
    inc ecx
    cmp ecx, 32
    jl init_loop
    
    ; Print the buffer
    xor ecx, ecx
print_loop:
    push ecx
    push dword [esi + ecx*4] 
    push fmt_int
    call printf
    add esp, 8 
    inc ecx
    cmp ecx, 32
    jl print_loop
    
    ; Print newline
    push newline
    call printf
    add esp, 4

    ; Part b) Create and initialize LCG
    
    ; TODO: c) Call next_lcg with 1234
    ; Print its results

    ; TODO: d) Use the map function to apply the LCG next function
    ;          to each element in the buffer.
    ; Print the updated buffer

    ; Return 0
    xor eax, eax
    leave
    ret

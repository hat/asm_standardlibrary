; tell compiler to use 64 bit code
[bits 64]

; tell assembler functions to export
global _ft_isalpha

; text is where all the code lives
section .text

; int ft_isalpha(int c);
_ft_isalpha:
	xor 	rax, rax 		; zero out rax buffer

	; check if c is greater than 'A'
	cmp 	rdi, 'A'		; cmp rdi (int c) >= 'A'
	jl		.end			; return false if <=

	; check if c is less than or equal to 'Z'
	cmp 	rdi, 'Z'		; cmp rdi (int c) <= 'Z'
	jle 	.set_true		; return true if <=

	; check if c is less than or equal to '`'
	cmp 	rdi, '`'		; cmp rdi (int c) <= '`'
	jle 	.end			; return false if <=

	; check if c is less or equal to 'z'
	cmp 	rdi, 'z'		; cmp rdi (int c) <= 'z'
	jg 		.end			; jump to ret_true

	; set to 1 and return
	.set_true:
	mov 	rax, 1			; set rax to 1

	; return false
	.end:
	ret						; return rax 0
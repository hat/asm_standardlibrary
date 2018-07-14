; tell compiler to use 64 bit code
[bits 64]

; tell assembler functions to export
global _ft_isalpha

; text is where all the code lives
section .text

; int ft_isalpha(int c);
_ft_isalpha:
	xor rax, rax 		; zero out rax buffer
	mov rax, 0 			; set rax to true initially

	; check if c is greater than 'a'
	cmp rdi, 'a' 		; cmp rdi (int c) more than 'a'
	jg	.sec_check		; jump to second check

	; check if c is greater than 'A'
	cmp rdi, 'A' 		; cmp rdi (int c) more than 'A'
	jg	.sec_check		; jump to second check

	; return false
	ret

	; run second test
	.sec_check:
	cmp rdi, 'z' 		; cmp rdi (int z) less than 'z'
	jl	.set_true		; end program if c is more than 'z'
	cmp rdi, 'Z' 		; cmp rdi (int z) less than 'Z'
	jl	.set_true		; end program if c is more than 'Z'

	; set to 1 and return
	.set_true:
	mov rax, 1
	ret
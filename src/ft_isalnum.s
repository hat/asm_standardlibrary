; tell compiler to use 64 bit code
[bits 64]

; tell assembler functions to import
extern _ft_isalpha
extern _ft_isdigit    ;declaring  the external function

; tell assembler functions to export
global _ft_isalnum

; text is where all code exists
section .text

; int ft_isalnum(int c)
_ft_isalnum:

	xor			rax, rax 		; zero out rax registry

	call _ft_isdigit
	cmp rax, 1 ; see if true
	jz	.ret_true

	call _ft_isalpha
	cmp rax, 1 ; see if true
	jz .ret_true

	mov rax, 0
	ret;

	.ret_true:
	ret


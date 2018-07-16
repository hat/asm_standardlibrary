; tell compiler to use 64 bit code
[bits 64]

; tell assembler functions to export
global _ft_isdigit

; .text is where all code exists
section .text

; int ft_isdigit(int c)
_ft_isdigit:
	xor			rax, rax 	; zero out rax registry

	; check if rdi is less than 0
	cmp			rdi, 48
	jl			.end

	; check if rdi is less than 9
	.sec_check:
	cmp			rdi, 57
	jg			.end

	mov rax, 1

	; set rax (return value) to true and return
	.end:
	ret						; return true


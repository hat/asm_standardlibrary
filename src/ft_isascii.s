; tell compiler to use 64 bit code
[bits 64]

; tell assembler functions to export
global _ft_isascii

; text is where all code lives
section .text

; int ft_isascii(int c)
_ft_isascii:
	xor		rax, rax ; zero out rax registry

	; compare if rdi (c) is less than 0
	cmp rdi, 0
	jl	.end

	; compate if rdi (c) is more than 127 (ascii del)
	cmp rdi, 127
	jg	.end

	mov rax, 1		; set rax (return) to true

	.end
	ret
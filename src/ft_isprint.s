; tell compiler to use 64 bit code
[bits 64]

; tell assembler functions to export
global _ft_isprint

; text is where all code lives
section .text

; int ft_isprint(int c)
_ft_isprint:
	xor		rax, rax ; zero out rax registry

	; compare if rdi (c) < sp
	cmp rdi, ' '
	jl	.end

	; compare if rdi (c) > ~
	cmp rdi, '~'
	jg	.end

	mov rax, 1

	.end
	ret
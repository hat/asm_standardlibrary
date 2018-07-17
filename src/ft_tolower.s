; tell compiler to use 64 bit code
[bits 64]

; tell assembler functions to export
global _ft_tolower

; text is where all code goes
section .text

; int ft_toupper(int c)
_ft_tolower:
	xor rax, rax ; zero out rax registry

	; copy rdi (c) into rax
	mov rax, rdi

	; check if rdi (c) is < 'a'
	cmp rdi, 'A'
	jl .end

	; check if rdi (c) is > 'z'
	cmp rdi, 'Z'
	jg .end

	; convert rdi (c) to lowercase
	add rdi, 32
	mov rax, rdi 		; set rax to rdi

	.end:
	ret

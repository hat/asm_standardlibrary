; Tell compiler to use 64 bit code
[bits 64]

; Tell assembler what symbols (functions) to export
global _ft_bzero

; .text section is where all code lives
section .text

; void ft_bzero(void *s, size_t n)
_ft_bzero:
	xor		rax, rax 		; set rax to zero
	mov		rax, rsi		; set rax to size_t n -- rsi is second arg

	.loop_start:
	cmp		rax, 0			; check if rax (size_t n) is null
	jz		.finish_loop	; if cmp is 0 finish

	mov		byte [rdi], 0	; set char of rdi to null
	inc		rdi				; rdi++
	dec		rax				; rax--

	jmp		.loop_start

	.finish_loop:
	ret						; return
	
; NEEEDS TO CHECK FOR NEGATIVE 

; Tell compiler to use 64 bit code
[bits 64]

; Tell assembler what symbols (functions) to export
global _ft_bzero

; .text section is where all code lives
section .text

; void ft_bzero(void *s, size_t n)
_ft_bzero:
	.loop_start:
	cmp		rsi, 0			; check if rsi (size_t n) is null
	jnge	.finish_loop	; if not greater or equal to 1

	mov		byte [rdi], 0	; set char of rdi to null
	inc		rdi				; rdi++
	dec		rsi				; rsi--

	jmp		.loop_start		; jump back to loop_start

	.finish_loop:
	ret						; return
	
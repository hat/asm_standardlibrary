; NEEDS SOME WORK
; tell compiler to use 64 bit code
[bits 64]

; tell assembler what functions to export
global _ft_strcat

; text is where all code lives
section .text

; char *ft_strcat(char *restrict s1, const char *restrict s2);
_ft_strcat:
	xor		rax, rax ; zero out rax buffer
	mov		rax, rdi ; set rax to rdi (s1)

	xor		rdx, rdx ; zero out rdx buffer
	mov		rsi, rdx ; set rsi to rdx (s2)

	xor		rbx, rbx ; zero out rbx buffer (store return char*)

	; creat local label -- start with '.'
	.loop_start:
	cmp		rax, 0 			; check if rdi is zero
	jz		.second_loop	; if zero go to finish_loop

	mov		rbx, [rax] ; set rbx[0] to rax[0]
	inc		rax				; rax++
	inc 	rbx				; rbx++

	.second_loop:
	cmp		rax, 0 			; check if rsi is zero
	jz		.finish_loop	; if zero go to finish_loop

	inc 	rbx				; rbx++
	mov		rbx, [rsi] ; set rbx[0] to rax[0]
	inc		rsi				; rax++

	.finish_loop:
	ret						; return string




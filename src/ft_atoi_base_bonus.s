segment .text
global _ft_atoi_base

extern _ft_strlen

_ft_atoi_base:
	push	rdi
	push	rsi
	mov		rdi, rsi	; 1st = base
	call	_ft_strlen	; call strlen
	pop		rsi
	pop		rdi
	cmp		rax, 2		; if ret < 2
	jl		_return

	mov rcx, -1
	mov rdx, 0
	mov r8, 1

_skip_spaces:
	inc rcx
	cmp byte [rdi + rcx], 32
	jle _skip_spaces
	dec rcx
	jmp _recognize_sign


_minus:
	imul	r8, -1		
	jmp _recognize_sign

_recognize_sign:
	inc rcx
	cmp byte [rdi + rcx], 45
	je _minus
	cmp byte [rdi + rcx], 43
	jne _recognize_sign

_cycle:
	jmp _find_pos_prep

_find_pos_ret:
	mul rdx
	add rdx, r11
	inc rcx

_find_pos_prep:
	mov r10, 0
	mov r11, 0
	mov r10b, byte [rdi + rcx]

_find_pos:
	inc r11
	cmp byte [rsi + r11], 0
	je _return
	cmp byte [rsi + r11], r10b
	je _find_pos_ret
	jmp _find_pos


_return:
	mov rax, r8
	mul rdx
	mov rax, rdx
	ret

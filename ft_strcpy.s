section .text
	global _ft_strcmp
	extern _ft_strlen

_ft_strcmp:
	xor rcx, rcx
	xor rax, rax
	call _ft_strlen
	push rdi 
	add rdi, rax
	jmp .loop

.loop:
	cmp byte[rsi + rcx], 0
	je return
	mov dl, [rsi + rcx]
	mov [rdi + rcx], dl
	inc rcx
	jmp .loop

return:
	pop rax
	ret

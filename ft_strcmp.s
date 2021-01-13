section .text
	global _ft_strcmp

_ft_strcmp:
	mov rax, -1
	xor rcx, rcx
	xor rdx, rdx

.loop:
	inc rax
	mov dl, [rdi + rax]
	cmp dl, 0
	je return
	cmp [rsi + rax], dl
	je .loop
	
return:
	mov cl, [rsi + rax]
	sub rdx, rcx
	mov rax, rdx
	ret


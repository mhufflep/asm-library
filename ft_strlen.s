section .text
	global _ft_strlen

_ft_strlen:
	mov rax, -1

_loop:
	inc rax
	cmp byte [rdi + rax], 0
	jne _loop

return:
	ret
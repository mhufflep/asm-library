segment .text
	global _ft_strlen

_ft_strlen:
	mov rax, -1

cycle:
	inc 	rax
	cmp 	byte[rdi + rax], 0
	jne 	cycle
	ret
segment .text
global _ft_list_size

_ft_list_size:
	mov rax, 0

_cycle:
	cmp rdi, 0
	je _return
	inc rax
	mov rdi, [rdi + 8]
	jmp _cycle

_return:
	ret

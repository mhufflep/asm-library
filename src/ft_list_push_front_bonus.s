segment .text
global _ft_list_push_front

extern _malloc

_ft_list_push_front:
	push rsp
	cmp rdi, 0
	je _return
	 
	push rdi
	push rsi

	mov rdi, 16
	call _malloc
	
	pop rsi
	pop rdi

	cmp rax, 0
	je _return

	mov [rax], rsi
	push qword [rdi]
	pop qword [rax + 8]

	mov [rdi], rax

_return:
	pop rsp
	ret

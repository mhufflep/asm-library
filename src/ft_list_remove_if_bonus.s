segment .text
global _ft_list_remove_if

extern _free

_ft_list_remove_if:
	push rsp
	cmp			rdi, 0
	je	_return
	cmp	qword [rdi], 0
	je	_return

compare:
	push		rdi
	push		rsi
	push		rdx
	push		rcx
	
	mov			r10, [rdi]				; r10 = *begin_list
	mov			rdi, [r10]				; rdi = begin_list->data
	
	call		rdx

	pop			rcx
	pop			rdx
	pop			rsi
	pop			rdi

	cmp			rax, 0
	jne			_recursion

remove:

	push qword [r10 + 8] 				; stack +=  (*begin_list)->next;

	push		rdi
	push		rsi
	push		rdx
	push		rcx

	push		r10

	mov			rdi, [r10]				; rdi = (*begin_list)->data)
	call rcx							; free_ctl((*begin_list)->data)
	
	pop			r10

	mov			rdi, r10 				; free(*begin_list)
	call _free							;

	pop			rcx
	pop			rdx
	pop			rsi
	pop			rdi

	pop qword [rdi]

	call	_ft_list_remove_if

_return:
	pop rsp
	ret

_recursion:
	mov			r11, 8
	add			r10, r11
	mov			rdi, r10
	call	_ft_list_remove_if
	jmp		_return
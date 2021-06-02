; #################################################################	;
;																	;
;		void ft_list_sort(t_list **begin_list, int (*cmp)());		;
;																	;
;		This function sorts list related to begin_list.				;
;																	;
;		It takes two arguments:										;
;																	;
;		t_list **begin_list: an address of a pointer				;
;		that stored the address of beginning element of				;
;		the list.													;
;																	;
;		int (*cmp)(): a function that compares datas.				;
;		It should return 0 if data is equal.						;
;																	;
; #################################################################	;

segment .text
global _ft_list_sort

_ft_list_sort:
	cmp			rdi, 0
	je _return						; compare lst and *lst with null-value
	cmp			qword [rdi], 0
	je _return

	cmp			rsi, 0				; check if compare function is not null
	je _return

	mov			rcx, [rdi]			; save *lst into rcx
_iterate:
	mov			rdi, rcx			; restore *lst from rcx
_check_lst:
	cmp			rdi, 0				; check lst != NULL
	je _return

	cmp			qword [rdi + 8], 0	; check if lst->next != NULL
	je _return
 
_iterate_loop:
	push		rdi
	push		rsi
	push		rcx
	push		rdx

	mov			rdx, rsi			; save cmp to rdx
	mov			r10, [rdi + 8]		; r10 = lst->next
	mov			rsi, [r10]			; r9 = lst->next->data
	mov			rdi, [rdi]			; rdi = lst->data
	mov			rax, 0

	call rdx						; call cmp

	pop			rdx
	pop			rcx
	pop			rsi
	pop			rdi

	cmp			eax, 0				; compare returned value with 0
	jg _swap_data
_skip_iteration:
	mov			rdi, [rdi + 8]		; lst = lst->next
	jmp _check_lst

_swap_data:
	push		qword [rdi]			; save lst->data
	mov			r10, [rdi + 8]		; r10 = lst->next
	push		qword [r10]			; save lst->next->data
	pop			qword [rdi]			; restore lst->next->data into lst->data 
	pop			qword [r10]			; restore lst->data into lst->next->content
	jmp _iterate

_return:
	ret

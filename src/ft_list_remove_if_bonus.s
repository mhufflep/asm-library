; ################################################################# ;
;                                                                   ;
;      void ft_list_remove_if(t_list **begin_list, void *data,      ;
;                int (*cmp)(), void (*free_ctl)(void *))            ;
;                                                                   ;
;        This function removes an element from list related to      ;
;        begin_list if element's data is equal to the data that     ;
;        passed as a second argument.                               ;
;                                                                   ;
;        It takes four arguments:                                   ;
;                                                                   ;
;        t_list **begin_list: an address of a pointer               ;
;        that stored the address of beginning element of            ;
;        the list.                                                  ;
;                                                                   ;
;        void *data: a pointer to the memory that should            ;
;        be compared with current element's data.                   ;
;                                                                   ;
;        int (*cmp)(): a function that compares datas.              ;
;        It should return 0 if data is equal.                       ;
;                                                                   ;
;        void (*free_ctl)(void *): a function that will             ;
;        free data of removed element.                              ;
;                                                                   ;
; ################################################################# ;

segment .text
global _ft_list_remove_if

extern _free

_ft_list_remove_if:
	push		rsp
	cmp			rdi, 0
	je	_return
	cmp			qword [rdi], 0
	je	_return

compare:
	push		rdi
	push		rsi
	push		rdx
	push		rcx
	
	mov			r10, [rdi]       ; r10 = *begin_list
	mov			rdi, [r10]       ; rdi = begin_list->data
	
	call rdx

	pop			rcx
	pop			rdx
	pop			rsi
	pop			rdi

	cmp			rax, 0
	jne _recursion

remove:

	push		qword [r10 + 8] 		; stack +=  (*begin_list)->next;

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

	call _ft_list_remove_if

_return:
	pop			rsp
	ret

_recursion:
	mov			r11, 8
	add			r10, r11
	mov			rdi, r10
	call _ft_list_remove_if
	jmp _return
; ################################################################# ;
;                                                                   ;
;    void    ft_list_push_front(t_list **begin_list, void *data);   ;
;                                                                   ;
;        This function allocates new t_list node, place             ;
;        data argument into this node and add this node             ;
;        to the list related with begin_list                        ;
;        system    to the 10-num system;                            ;
;                                                                   ;
;        It takes two arguments:                                    ;
;                                                                   ;
;        t_list **begin_list:    an address of a pointer            ;
;        that stored the address of beginning element of            ;
;        the list.                                                  ;
;                                                                   ;
;        void *data - a pointer to the memory that should           ;
;        be placed in node->data.                                   ;
;                                                                   ;
; ################################################################# ;

segment .text
global _ft_list_push_front

extern _malloc

_ft_list_push_front:
	push		rsp
	cmp			rdi, 0
	je _return
	 
	push		rdi
	push		rsi

	mov			rdi, 16		; size of t_list struct is equal to 16
	call _malloc
	
	pop			rsi
	pop			rdi

	cmp			rax, 0
	je _return

	mov			[rax], rsi
	push		qword [rdi]
	pop			qword [rax + 8]

	mov			[rdi], rax

_return:
	pop			rsp
	ret

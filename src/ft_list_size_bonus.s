; #################################################################	;
;																	;
;			int		ft_list_size(t_list *begin_list);				;
;																	;
;		This function returns the size of a list.					;
;																	;
;		It takes one argument:										;
;																	;
;		t_list *begin_list: an address of beginning element			;
;		of the list.												;
;																	;
; #################################################################	;

segment .text
global _ft_list_size

_ft_list_size:
	mov		rax, 0

_cycle:
	cmp		rdi, 0
	je _return
	inc rax
	mov		rdi, [rdi + 8]
	jmp _cycle

_return:
	ret

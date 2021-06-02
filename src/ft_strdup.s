; ################################################################# ;
;                                                                   ;
;              char *ft_strdup(const char *str);                    ;
;                                                                   ;
;        This function duplicates the string using malloc.          ;
;        Returns a pointer to the new string.                       ;
;                                                                   ;
;        It takes one argument:                                     ;
;                                                                   ;
;        const char *str: an address of beginning                   ;
;        of a NULL-terminated string.                               ;
;                                                                   ;
; ################################################################# ;

segment .text
	global _ft_strdup

extern _malloc
extern _ft_strlen
extern _ft_strcpy

_ft_strdup:
	mov			rax, 0
	push		rdi
	call _ft_strlen
	inc			rax
	mov			rdi, rax
	call _malloc
	jz return
	pop			rsi
	mov			rdi, rax
	call _ft_strcpy
	mov			rdi, rsi
	ret

return:
	pop			rdi
	ret
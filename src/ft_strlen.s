; ################################################################# ;
;                                                                   ;
;             size_t    ft_strlen(const char *str);                 ;
;                                                                   ;
;        This function counts the size of the str.                  ;
;                                                                   ;
;        It takes one argument:                                     ;
;                                                                   ;
;        const char *str: an address of beginning                   ;
;        of a NULL-terminated string.                               ;
;                                                                   ;
; ################################################################# ;

segment .text
	global _ft_strlen

_ft_strlen:
	mov		rax, -1

cycle:
	inc rax
	cmp		byte[rdi + rax], 0
	jne cycle
	ret
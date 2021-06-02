; ################################################################# ;
;                                                                   ;
;        char *ft_strcpy(char *dst, const char *src);               ;
;                                                                   ;
;        This function copy the string src to dst                   ;
;        (including the terminating `\0' character.)                ;
;                                                                   ;
;        WARN: (Does not allocate memory)                           ;
;                                                                   ;
;        It takes two argument:                                     ;
;                                                                   ;
;        char *dst: a pointer to the destination string.            ;
;                                                                   ;
;        const char *src: a pointer to the source string.           ;
;                                                                   ;
; ################################################################# ;

segment .text
	global _ft_strcpy

_ft_strcpy:
	mov		rax, 0

cycle:
	cmp		byte[rsi + rax], 0
	je return
	mov		dl, byte[rsi + rax]
	mov		byte[rdi + rax], dl
	inc rax
	jmp cycle

return:
	mov		byte[rdi + rax], 0
	mov		rax, rdi
	ret

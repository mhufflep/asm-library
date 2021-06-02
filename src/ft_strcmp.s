; #################################################################	;
;																	;
;		int ft_strcmp(const char *str1, const char *str2);			;
;																	;
;		This function functions lexicographically compare			;
;		the null-terminated strings str1 and str2.					;
;																	;
; #################################################################	;

segment .text
	global _ft_strcmp

_ft_strcmp:
	mov			rax, 0
	mov			rcx, 0
	mov			rdx, 0

cycle:
	mov			cl, byte[rdi + rax]
	mov			dl, byte[rsi + rax]
	cmp			cl, dl
	jne return
	cmp			byte[rdi + rax], 0
	je return
	inc rax
	jmp cycle

return:
	sub			rcx, rdx
	mov			rax, rcx
	ret
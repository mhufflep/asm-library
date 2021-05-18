segment .text
	global _ft_strcpy

_ft_strcpy:
        mov     rax, 0

cycle:
        cmp     byte[rsi + rax], 0
        je      return
        mov dl, byte[rsi + rax]
        mov     byte[rdi + rax], dl
        inc     rax
        jmp cycle

return:
        mov     byte[rdi + rax], 0
        mov     rax, rdi
        ret

segment .text
	global _ft_strdup

extern _malloc
extern _ft_strlen
extern _ft_strcpy

_ft_strdup:
        mov rax, 0
        push rdi
        call _ft_strlen
        inc rax
        mov rdi, rax            ; rdi - first argument , rsi - second, rdx - third 
        call _malloc
        jz return
        pop rsi
        mov rdi, rax
        call _ft_strcpy         ; rdi - dst, rsi - src
        mov rdi, rsi
        ret

return:
        pop rdi
        ret
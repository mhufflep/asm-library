segment .text
	global _ft_read

extern ___error

_ft_read:
        mov rax, 0x2000003
        syscall
        jc set_errno
        ret

set_errno:
        push r10
        mov r10, rax
        call ___error
        mov [rax], r10
        pop r10
        mov rax, -1
        ret
        
segment .text
global _ft_list_sort

extern _ft_strlen

_ft_list_sort:
	mov r8, 0		; len
	mov r9, 0		; sorted
	mov rdx, 0		; tmp *
	; mov rcx, 0	; char 0*

_cycle_external:
	cmp r9, 1
	je _return
	mov r9, 1
	mov rdx, [rdi]

_cycle_internal:
	cmp qword [rdx + 8], 0
	je _return

	push rdi
	push rsi

	mov rcx, rsi			;cmp save
	mov rdi, [rdx]			;tmp->content
	mov r8, [rdx + 8]		;tmp->next into r8
	mov rsi, [r8]
	
	call rcx
	
	pop rsi
	pop rdi

	cmp rax, 0
	ja _swap

	mov rdx, [rdx + 8]

	jmp _cycle_internal

	jmp _cycle_external

_swap:
	push qword [rdx]
	push qword [r8]
	pop qword [rdx]
	pop qword [r8]
	mov r9, 0
	jmp _cycle_external

_return:
	ret
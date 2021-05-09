segment .text
global _ft_list_sort

extern _ft_strlen

; void	ft_lstsort(t_list **lst, cmp)
; {
; 	int		len;
; 	int		sorted;
; 	t_list	*tmp;
; 	char	*str;

; 	sorted = 0;
; 	while (!sorted)
; 	{
; 		tmp = lst;
; 		sorted = 1;
; 		while (tmp && tmp->next != NULL)
; 		{
; 			len = ft_strlen(tmp->content) + 1;
; 			if (ft_memcmp(tmp->content, tmp->next->content, len) > 0)
; 			{
; 				str = tmp->content;
; 				tmp->content = tmp->next->content;
; 				tmp->next->content = str;
; 				sorted = 0;
; 				break ;
; 			}
; 			tmp = tmp->next;
; 		}
; 	}
; }

_ft_list_sort:
	mov r8, 0 ;len
	mov r9, 0 ; sorted
	mov rdx, 0 ; tmp *
	; mov rcx, 0 ; char 0*

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
	; mov rcx, [rdx]
	; mov r11, [r8]
	pop qword [rdx]
	pop qword [r8]
	; mov [rdx], r11
	; mov [r8], rcx
	mov r9, 0
	jmp _cycle_external

_return:
	ret
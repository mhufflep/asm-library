segment .text
global _ft_atoi_base

extern _ft_strlen

_ft_atoi_base:
	mov rdx, 0			; number value
	mov r8, 0 			; negative

	push rdi
	push rsi

	mov rdi, rsi
	call _ft_strlen

	pop rsi
	pop rdi

	cmp rax, 2			; check base length
	jl _error
	
	mov rcx, rax		; get base length

; ####################### ;
;	CHECK BASE STRING	  ;
; ####################### ;

_check_base:
	push rsi
	
_cb_loop_beg_i:
	cmp byte[rsi], 0
	je _check_base_end


	cmp byte[rsi], 32
	jle _cb_err
	cmp   byte [rsi], 43
	je    _cb_err
	cmp   byte [rsi], 45
	je    _cb_err
	mov r9, 1
	mov r10b, byte [rsi]

_cb_loop_beg_j:
	cmp byte [rsi + r9], 0
	je _cb_loop_end_i
	cmp byte [rsi + r9], r10b
	je _cb_err
	inc r9
	jmp _cb_loop_beg_j
_cb_loop_end_i:
	inc rsi
	jmp _cb_loop_beg_i

_cb_err:
	pop rsi
	jmp _return

_check_base_end:
	pop rsi
	jmp _skip_spaces


; ####################### ;
;		SKIP  SPACES	  ;
; ####################### ;
_skip_spaces_inc:
	inc rdi

_skip_spaces:
	cmp byte[rdi], 32
	jle _skip_spaces_inc
	jmp   _sign


; ####################### ;
;			SIGN		  ;
; ####################### ;
_set_minus:
	xor	r8, 1
_set_plus:
	inc rdi
_sign:
	cmp byte [rdi], 43 ; +
	je _set_plus
	cmp byte [rdi], 45 ; -
	je _set_minus


; ####################### ;
;		MAIN CYCLE		  ;
; ####################### ;
_main_cycle:

	cmp byte [rdi], 0
	je _return

_get_index:
	mov rax, 0
	mov r9b, byte [rdi]
_get_index_cycle:
	cmp byte [rsi + rax], 0
	je _get_index_ret
	cmp byte[rsi + rax], r9b
	je _get_index_ret
	inc rax
	jmp _get_index_cycle

_get_index_ret:

	cmp rax, rcx
	je _return

	imul rdx, rcx
	add rdx, rax
	inc rdi
	jmp _main_cycle


; ####################### ;
;		RETURN & ERROR	  ;
; ####################### ;
_error:
	mov rax, 0

_return:
	cmp r8, 1
	je _mul_minus
	mov rax, rdx
	ret

_mul_minus:
	imul rdx, -1
	xor	r8, 1
	jmp _return

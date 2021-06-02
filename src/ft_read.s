; #################################################################	;
;																	;
;		ssize_t	ft_read(int fd, void *buffer, size_t length);		;
;																	;
;		This function tries to read length bytes					;
;		from a file related to fd to the 'buffer'.					;
;																	;
;		On success it returns the amount of readed bytes.			;
;																	;
;		On error it returns -1 and set errno properly.				;
;																	;
;		It takes three arguments:									;
;																	;
;		int fd: A file descriptor that is associated				;
;		with the file or device to be read.  						;
;																	;
;		void *buffer: stored readed bytes.							;
;																	;
;		size_t length: a number of bytes that should be readed.		;
;																	;
; #################################################################	;

segment .text
	global _ft_read

extern ___error

_ft_read:
	mov			rax, 0x2000003
	syscall
	jc set_errno
	ret

set_errno:
	push		rax
	call ___error
	pop			qword [rax]
	mov			rax, -1
	ret
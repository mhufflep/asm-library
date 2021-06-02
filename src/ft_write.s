; #################################################################	;
;																	;
;	ssize_t	ft_write(int fd, const void *buffer, size_t length);	;
;																	;
;		This function tries to write length bytes					;
;		from the 'buffer' to a file/device related to fd.			;
;																	;
;		On success it returns the amount of written bytes.			;
;																	;
;		On error it returns -1 and set errno properly.				;
;																	;
;		It takes three arguments:									;
;																	;
;		int fd: A file descriptor that is associated				;
;		with the file or device to write.							;
;																	;
;		void *buffer: contains the data that should be written.		;
;																	;
;		size_t length: a number of bytes that should be written.	;
;																	;
; #################################################################	;

segment .text
	global _ft_write

extern ___error

_ft_write:
	mov			rax, 0x2000004
	syscall
	jc set_errno
	ret

set_errno:
	push		rax
	call ___error
	pop			qword [rax]
	mov			rax, -1
	ret

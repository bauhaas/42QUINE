;Grace quine

%define STR ";Grace quine%3$c%3$c%%define STR %5$c%1$s%5$c%3$c%%define FILENAME %5$cGrace_kid.s%5$c%3$c%3$csection .data%3$cstr: db STR, 0%3$cfilename: db FILENAME, 0%3$cmode: db %5$cw+%5$c, 0%3$c%3$csection .text%3$cglobal main%3$cextern exit%3$cextern fopen%3$cextern fclose%3$cextern fprintf%3$c%3$c%%macro FT 0%3$c%2$cmain:%3$c%2$c%2$cpush rbp%3$c%2$c%2$cmov rbp, rsp%3$c%2$c%2$cmov rdi, filename%3$c%2$c%2$cmov rsi, mode%3$c%2$c%2$ccall fopen%3$c%2$c%2$cpush rax%3$c%2$c%2$cmov rdi, rax%3$c%2$c%2$cmov rsi, str%3$c%2$c%2$cmov rdx, str%3$c%2$c%2$cmov rcx, 9%3$c%2$c%2$cmov r8, 10%3$c%2$c%2$cpush 34%3$c%2$c%2$ccall fprintf%3$c%2$c%2$cpop rax%3$c%2$c%2$cpop rdi%3$c%2$c%2$ccall fclose%3$c%2$c%2$cmov rsp, rbp%3$c%2$c%2$cpop rbp%3$c%2$c%2$cret%3$c%%endmacro%3$c%3$cFT%3$c"
%define FILENAME "Grace_kid.s"

section .data
str: db STR, 0
filename: db FILENAME, 0
mode: db "w+", 0

section .text
global main
extern exit
extern fopen
extern fclose
extern fprintf

%macro FT 0
	main:
		push rbp				;
		mov rbp, rsp			;	stack frame init
		mov rdi, filename 		;
		mov rsi, mode 			; set params for fopen call
		call fopen				; fopen(filename, mode)
		push rax				; save rax (FD value) for fclose
		mov rdi, rax 			;
		mov rsi, str 			;
		mov rdx, str 			; set params for fprintf call
		mov rcx, 9 				;
		mov r8, 10				;
		push 34					;
		call fprintf			; fprintf(rax, str, str, "\t", "\n", "\"")
		pop rax					; remove 34 from the stack
		pop rdi					; move fopen return into rdi
		call fclose				; fclose(rax)
		mov rsp, rbp			;
		pop rbp					; restore original stack
		ret 					; end
%endmacro

FT

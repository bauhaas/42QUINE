section .data
CODE db "section .data%3$cCODE db %4$c%1$s%4$c,0%3$cFILENAME db %4$cGrace_kid.s%4$c,0%3$cFOPENOPTIONS db %4$cw%4$c,0%3$c%3$csection .text%3$cglobal main%3$cextern exit%3$cextern fopen%3$cextern fclose%3$cextern fprintf%3$c%3$c; i am a comment !%3$c%3$c%5$cmacro FT 0%3$c%2$cgoodexit:%3$c%2$c%2$cmov rsp, rbp%3$c%2$c%2$cpop rbp%3$c%3$c%2$c%2$cmov rdi, 0%3$c%2$c%2$ccall exit%3$c%3$c%2$cbadexit:%3$c%2$c%2$cmov rsp, rbp%3$c%2$c%2$cpop rbp%3$c%3$c%2$c%2$cmov rdi, 1%3$c%2$c%2$ccall exit%3$c%3$c%2$cmain:%3$c%2$c%2$cpush rbp%3$c%2$c%2$cmov rbp, rsp%3$c%3$c%2$c%2$cmov rdi, FILENAME%3$c%2$c%2$cmov rsi, FOPENOPTIONS%3$c%2$c%2$ccall fopen%2$c%2$c%2$c%2$c; fopen(FILENAME, %4$cw%4$c);%3$c%3$c%2$c%2$ccmp rax, 0%3$c%2$c%2$cjz badexit%2$c%2$c%2$c%2$c; if fopen return == NULL, return -1%3$c%3$c%2$c%2$cpush rax%2$c%2$c%2$c%2$c; save rax for fclose%3$c%3$c%2$c%2$cmov rdi, rax%3$c%2$c%2$cmov rsi, CODE%3$c%2$c%2$cmov rdx, CODE%3$c%2$c%2$cmov rcx, 9%3$c%2$c%2$cmov r8, 10%3$c%2$c%2$cmov r9, 34%3$c%2$c%2$cpush 37%2$c%2$c%2$c%2$c%2$c; 7th arg onto the stack%3$c%2$c%2$cmov al, 0%3$c%2$c%2$ccall fprintf%2$c%2$c%2$c%2$c; write to file%3$c%2$c%2$cpop rdi%2$c%2$c%2$c%2$c%2$c; remove 37 from the stack%3$c%3$c%2$c%2$cpop rdi%2$c%2$c%2$c%2$c%2$c; move fopen return into rdi%3$c%2$c%2$ccall fclose%2$c%2$c%2$c%2$c; fclose%3$c%3$c%2$c%2$cjmp goodexit%3$c%3$c%5$cendmacro%3$c%3$cFT",0
FILENAME db "Grace_kid.s",0
FOPENOPTIONS db "w",0

section .text
global main
extern exit
extern fopen
extern fclose
extern fprintf

; i am a comment !

%macro FT 0
	goodexit:
		mov rsp, rbp
		pop rbp

		mov rdi, 0
		call exit

	badexit:
		mov rsp, rbp
		pop rbp

		mov rdi, 1
		call exit

	main:
		push rbp
		mov rbp, rsp

		mov rdi, FILENAME
		mov rsi, FOPENOPTIONS
		call fopen				; fopen(FILENAME, "w");

		cmp rax, 0
		jz badexit				; if fopen return == NULL, return -1

		push rax				; save rax for fclose

		mov rdi, rax
		mov rsi, CODE
		mov rdx, CODE
		mov rcx, 9
		mov r8, 10
		mov r9, 34
		push 37					; 7th arg onto the stack
		mov al, 0
		call fprintf				; write to file
		pop rdi					; remove 37 from the stack

		pop rdi					; move fopen return into rdi
		call fclose				; fclose

		jmp goodexit

%endmacro

FT
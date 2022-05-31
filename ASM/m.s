;Grace quine

%define STR ";Grace quinedddd%3$c"
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

		mov rdi, filename
		mov rsi, mode
		call fopen				; fopen(filename, "w");

		cmp rax, 0
		jz badexit				; if fopen return == NULL, return -1

		push rax				; save rax for fclose

		mov rdi, rax
		mov rsi, str
		mov rdx, str
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
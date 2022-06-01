section .data
data: db "section .data%3$cdata: db %4$c%1$s%4$c, 0%3$cfilename_buffer: db 16%3$cfilename: db %4$cSully_%5$cd.s%4$c, 0%3$copen_mode: db %4$cw+%4$c, 0%3$ccommand_buffer: db 64%3$ccompile_command: db %4$cnasm -f elf64 Sully_%5$c1$d.s && clang Sully_%5$c1$d.o -o Sully_%5$c1$d%4$c, 0%3$crun_command: db %4$c./Sully_%5$c1$d%4$c, 0%3$c%3$csection .text%3$cglobal main%3$cextern fopen%3$cextern fclose%3$cextern sprintf%3$cextern fprintf%3$cextern system%3$c%3$cmain:%3$cpush r12%3$cmov r12, %2$d%3$cdec r12%3$c%3$cmov rdi, filename_buffer%3$cmov rsi, filename%3$cmov rdx, r12%3$ccall sprintf%3$c%3$cmov rdi, filename_buffer%3$cmov rsi, open_mode%3$ccall fopen%3$cpush rax%3$c%3$cmov rdi, rax%3$cmov rsi, data%3$cmov rdx, data%3$cmov rcx, r12%3$cmov r8, 10%3$cmov r9, 34%3$cpush 37%3$ccall fprintf%3$cpop rdi%3$c%3$cpop rdi%3$ccall fclose%3$c%3$cmov rdi, command_buffer%3$cmov rsi, compile_command%3$cmov rdx, r12%3$ccall sprintf%3$c%3$cmov rdi, command_buffer%3$ccall system%3$c%3$ccmp r12, 1%3$cjle end%3$c%3$cmov rdi, command_buffer%3$cmov rsi, run_command%3$cmov rdx, r12%3$ccall sprintf%3$c%3$cmov rdi, command_buffer%3$ccall system%3$c%3$cend:%3$cpop r12%3$cret", 0
filename_buffer: db 16
filename: db "Sully_%d.s", 0
open_mode: db "w+", 0
command_buffer: db 64
compile_command: db "nasm -f elf64 Sully_%1$d.s && clang Sully_%1$d.o -o Sully_%1$d", 0
run_command: db "./Sully_%1$d", 0

section .text
global main
extern fopen
extern fclose
extern sprintf
extern fprintf
extern system

main:
push r12
mov r12, 5
dec r12

mov rdi, filename_buffer
mov rsi, filename
mov rdx, r12
call sprintf                ;set filename_buffer

mov rdi, filename_buffer
mov rsi, open_mode
call fopen
push rax                    ;open filename_buffer

mov rdi, rax
mov rsi, data
mov rdx, data
mov rcx, r12
mov r8, 10
mov r9, 34
push 37
call fprintf                 ;print to file
pop rdi

pop rdi
call fclose                 ;close file

mov rdi, command_buffer
mov rsi, compile_command
mov rdx, r12
call sprintf                ;set command_buffer

mov rdi, command_buffer
call system

cmp r12, 1
jle end                ;exit exec loop

mov rdi, command_buffer
mov rsi, run_command
mov rdx, r12
call sprintf        ;set exec to buffer

mov rdi, command_buffer
call system         ;exec again

end:
pop r12
ret
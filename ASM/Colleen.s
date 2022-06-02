;colleen

section .text
global main
extern printf

main:
push rbp
mov rbp, rsp
mov rdi, format
mov rsi, format
mov rdx, 10
mov rcx, 34
call printf
mov rsp, rbp
pop rbp
call end

end:
ret ;ret

section .data
format:
db ";colleen%2$c%2$csection .text%2$cglobal main%2$cextern printf%2$c%2$cmain:%2$cpush rbp%2$cmov rbp, rsp%2$cmov rdi, format%2$cmov rsi, format%2$cmov rdx, 10%2$cmov rcx, 34%2$ccall printf%2$cmov rsp, rbp%2$cpop rbp%2$ccall end%2$c%2$cend:%2$cret ;ret%2$c%2$csection .data%2$cformat:%2$cdb %3$c%1$s%3$c, 0", 0
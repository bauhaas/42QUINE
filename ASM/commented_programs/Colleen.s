;colleen

section .text
global main
extern printf

main:
push rbp            ;
mov rbp, rsp        ; stack frame init
mov rdi, format     ;
mov rsi, format     ; set params for printf call
mov rdx, 10         ;
mov rcx, 34         ;
call printf         ; printf(format, format "\n", "\"")
mov rsp, rbp        ;
pop rbp             ; restore original stack
ret ;ret            ; end

section .data
format:
db ";colleen%2$c%2$csection .text%2$cglobal main%2$cextern printf%2$c%2$cmain:%2$cpush rbp%2$cmov rbp, rsp%2$cmov rdi, format%2$cmov rsi, format%2$cmov rdx, 10%2$cmov rcx, 34%2$ccall printf%2$cmov rsp, rbp%2$cpop rbp%2$cret ;ret%2$c%2$csection .data%2$cformat:%2$cdb %3$c%1$s%3$c, 0", 0
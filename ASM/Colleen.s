section .text
	extern printf
	global _main

func:
	ret

_main:
	mov rax, 0
	ret


;nasm Colleen.s -f elf64
;ld -s -o Colleen Colleen.o
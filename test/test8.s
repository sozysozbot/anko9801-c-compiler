.intel_syntax noprefix
.extern _print
.global _main
	.long 0
_main:
	push rbp
	mov rbp, rsp
	sub rsp, 0
	lea rax, DWORD PTR [rip + b@GOTPCREL]
	push rax
	pop rax
	mov eax, DWORD PTR [rax]
	push rax
	pop rdi
	mov rax, 1
	test rsp, 15
	jne call.else0
	call _print
	jmp call.end0
call.else0:
	push rsi
	call _print
	pop rsi
call.end0:
	push rax
	push 0
	pop rbp
	ret

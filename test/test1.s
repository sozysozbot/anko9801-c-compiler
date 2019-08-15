.intel_syntax noprefix
.extern _print
.global _main, _fibo
_fibo:
	push rbp
	mov rbp, rsp
	sub rsp, 24
	mov [rbp-8], rdi
	mov [rbp-16], rsi
	mov [rbp-24], rdx
	mov rax, rbp
	sub rax, 24
	push rax
	pop rax
	mov rax,  [rax]
	push rax
	push 20
	pop rbx
	pop rax
	cmp rax, rbx
	sete al
	movzx rax, al
	push rax
	cmp rax, 1
	je if.then0
	jmp if.else0
if.then0:
	push 0
	pop rax
	mov rsp, rbp
	pop rbp
	ret
if.else0:
	jmp if.end0
if.end0:
	mov rax, rbp
	sub rax, 8
	push rax
	pop rax
	mov rax,  [rax]
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
	mov rax, rbp
	sub rax, 8
	push rax
	pop rax
	mov rax,  [rax]
	push rax
	mov rax, rbp
	sub rax, 16
	push rax
	pop rax
	mov rax,  [rax]
	push rax
	pop rbx
	pop rax
	add rax, rbx
	push rax
	pop rdi
	mov rax, rbp
	sub rax, 8
	push rax
	pop rax
	mov rax,  [rax]
	push rax
	pop rsi
	mov rax, rbp
	sub rax, 24
	push rax
	pop rax
	mov rax,  [rax]
	push rax
	push 1
	pop rbx
	pop rax
	add rax, rbx
	push rax
	pop rdx
	mov rax, 3
	test rsp, 15
	jne call.else1
	call _fibo
	jmp call.end1
call.else1:
	push rsi
	call _fibo
	pop rsi
call.end1:
	pop rax
	mov rsp, rbp
	pop rbp
	ret
_main:
	push rbp
	mov rbp, rsp
	sub rsp, 0
	push 1
	pop rdi
	push 1
	pop rsi
	push 1
	pop rdx
	mov rax, 3
	test rsp, 15
	jne call.else2
	call _fibo
	jmp call.end2
call.else2:
	push rsi
	call _fibo
	pop rsi
call.end2:
	push 0
	pop rax
	mov rsp, rbp
	pop rbp
	ret

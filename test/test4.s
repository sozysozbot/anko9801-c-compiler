.intel_syntax noprefix
.global _main
_main:
	push rbp
	mov rbp, rsp
	sub rsp, 16
	lea rax, [rbp-8]
	push rax
	pop rdi
	push 1
	pop rsi
	push 2
	pop rdx
	push 4
	pop rcx
	push 8
	pop r8
	mov rax, 5
	test rsp, 15
	jne call.else0
	call _alloc4
	jmp call.end0
call.else0:
	push rsi
	call _alloc4
	pop rsi
call.end0:
	lea rax, [rbp-16]
	push rax
	lea rax, [rbp-8]
	push rax
	pop rax
	mov rax, QWORD PTR [rax]
	push rax
	push 8
	pop rbx
	pop rax
	add rax, rbx
	push rax
	pop rbx
	pop rax
	mov [rax], rbx
	lea rax, [rbp-16]
	push rax
	pop rax
	mov rax, QWORD PTR [rax]
	push rax
	pop rdi
	mov rax, 1
	test rsp, 15
	jne call.else1
	call _print
	jmp call.end1
call.else1:
	push rsi
	call _print
	pop rsi
call.end1:
	lea rax, [rbp-16]
	push rax
	pop rax
	mov rax, QWORD PTR [rax]
	push rax
	pop rax
	mov eax, DWORD PTR [rax]
	push rax
	pop rdi
	mov rax, 1
	test rsp, 15
	jne call.else2
	call _print
	jmp call.end2
call.else2:
	push rsi
	call _print
	pop rsi
call.end2:
	lea rax, [rbp-16]
	push rax
	pop rax
	mov rax, QWORD PTR [rax]
	push rax
	pop rdi
	mov rax, 1
	test rsp, 15
	jne call.else3
	call _print
	jmp call.end3
call.else3:
	push rsi
	call _print
	pop rsi
call.end3:
	lea rax, [rbp-16]
	push rax
	lea rax, [rbp-8]
	push rax
	pop rax
	mov rax, QWORD PTR [rax]
	push rax
	push 12
	pop rbx
	pop rax
	add rax, rbx
	push rax
	pop rbx
	pop rax
	mov [rax], rbx
	lea rax, [rbp-16]
	push rax
	pop rax
	mov rax, QWORD PTR [rax]
	push rax
	pop rax
	mov eax, DWORD PTR [rax]
	push rax
	pop rax
	mov rsp, rbp
	pop rbp
	ret

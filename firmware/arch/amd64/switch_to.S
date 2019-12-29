.section .text, "ax", @progbits
.global switch_to
switch_to:
    pop %rax
    mov %rax, 0x38(%rdi)  # rip
    mov %rbx, 0x0(%rdi)
    mov %rsp, 0x8(%rdi)
    mov %rbp, 0x10(%rdi)
    mov %r12, 0x18(%rdi)
    mov %r13, 0x20(%rdi)
    mov %r14, 0x28(%rdi)
    mov %r15, 0x30(%rdi)
    mov 0x0(%rsi), %rbx
    mov 0x8(%rsi), %rsp
    mov 0x10(%rsi), %rbp
    mov 0x18(%rsi), %r12
    mov 0x20(%rsi), %r13
    mov 0x28(%rsi), %r14
    mov 0x30(%rsi), %r15
    mov 0x38(%rsi), %rax  # rip
    push %rax
    mov %rsi, _current(%rip)
    mov %rdi, %rax
    ret

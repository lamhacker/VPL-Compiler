
.text
.global empty
.type empty, @function
.p2align 4,,15

empty:
    pushq   %rbp
    movq    %rsp, %rbp
    pushq   %rbx

    # allocate 0 local variables
    movq %rdi, %rax
    imulq $4, %rax, %rax
    addq $16, %rax
    imulq $0, %rax, %rax
    subq %rax, %rsp
    andq $-16, %rsp

    

    popq    %rbx
    leave
    ret


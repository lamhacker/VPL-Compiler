
.text
.global varOne
.type varOne, @function
.p2align 4,,15

varOne:
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

.text
.global varTwo
.type varTwo, @function
.p2align 4,,15

varTwo:
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

.text
.global varThree
.type varThree, @function
.p2align 4,,15

varThree:
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


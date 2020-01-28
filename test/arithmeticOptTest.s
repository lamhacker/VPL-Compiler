
.text
.global arithOpt1
.type arithOpt1, @function
.p2align 4,,15

arithOpt1:
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

    
    # load source address into %rax
    
    # place address of 5.0 into %rax
    movq $.const5.0, %rax


    # load destination address into %r10
    
    # place address of parameter into %r10
    movq %rsi, %r10


    movq %rdi, %rbx                    
    shrq $2, %rbx                      
                                       
    jz .loop_end0

.loop_begin0:
    movaps (%rax), %xmm0        # load source into %xmm0
    movaps %xmm0, (%r10)        # store %xmm0


    addq $16, %r10

    decq %rbx
    jnz .loop_begin0
.loop_end0:


    popq    %rbx
    leave
    ret

.text
.global arithOpt2
.type arithOpt2, @function
.p2align 4,,15

arithOpt2:
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

    
    # load source address into %rax
    
    # place address of 1.0 into %rax
    movq $.const1.0, %rax


    # load destination address into %r10
    
    # place address of parameter into %r10
    movq %rsi, %r10


    movq %rdi, %rbx                    
    shrq $2, %rbx                      
                                       
    jz .loop_end1

.loop_begin1:
    movaps (%rax), %xmm0        # load source into %xmm0
    movaps %xmm0, (%r10)        # store %xmm0


    addq $16, %r10

    decq %rbx
    jnz .loop_begin1
.loop_end1:


    popq    %rbx
    leave
    ret

.text
.global arithOpt3
.type arithOpt3, @function
.p2align 4,,15

arithOpt3:
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

    
    # load source address into %rax
    
    # place address of 8.0 into %rax
    movq $.const8.0, %rax


    # load destination address into %r10
    
    # place address of parameter into %r10
    movq %rsi, %r10


    movq %rdi, %rbx                    
    shrq $2, %rbx                      
                                       
    jz .loop_end2

.loop_begin2:
    movaps (%rax), %xmm0        # load source into %xmm0
    movaps %xmm0, (%r10)        # store %xmm0


    addq $16, %r10

    decq %rbx
    jnz .loop_begin2
.loop_end2:


    popq    %rbx
    leave
    ret

.text
.global arithOpt4
.type arithOpt4, @function
.p2align 4,,15

arithOpt4:
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

    
    # load source address into %rax
    
    # place address of 0.5 into %rax
    movq $.const0.5, %rax


    # load destination address into %r10
    
    # place address of parameter into %r10
    movq %rsi, %r10


    movq %rdi, %rbx                    
    shrq $2, %rbx                      
                                       
    jz .loop_end3

.loop_begin3:
    movaps (%rax), %xmm0        # load source into %xmm0
    movaps %xmm0, (%r10)        # store %xmm0


    addq $16, %r10

    decq %rbx
    jnz .loop_begin3
.loop_end3:


    popq    %rbx
    leave
    ret

.text
.global arithOpt5
.type arithOpt5, @function
.p2align 4,,15

arithOpt5:
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

    
    # load source address into %rax
    
    # place address of 2.0 into %rax
    movq $.const2.0, %rax


    # load destination address into %r10
    
    # place address of parameter into %r10
    movq %rsi, %r10


    movq %rdi, %rbx                    
    shrq $2, %rbx                      
                                       
    jz .loop_end4

.loop_begin4:
    movaps (%rax), %xmm0        # load source into %xmm0
    movaps %xmm0, (%r10)        # store %xmm0


    addq $16, %r10

    decq %rbx
    jnz .loop_begin4
.loop_end4:


    popq    %rbx
    leave
    ret

.text
.global arithOpt6
.type arithOpt6, @function
.p2align 4,,15

arithOpt6:
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

    
    # load source address into %rax
    
    # place address of parameter into %rax
    movq %rsi, %rax


    # load destination address into %r10
    
    # place address of parameter into %r10
    movq %rsi, %r10


    movq %rdi, %rbx                    
    shrq $2, %rbx                      
                                       
    jz .loop_end5

.loop_begin5:
    movaps (%rax), %xmm0        # load source into %xmm0
    movaps %xmm0, (%r10)        # store %xmm0


    addq $16, %rax             

    addq $16, %r10

    decq %rbx
    jnz .loop_begin5
.loop_end5:


    popq    %rbx
    leave
    ret

.data 
.align 16 
.const5.0:
    .float 5.0 
    .float 5.0 
    .float 5.0 
    .float 5.0

.data 
.align 16 
.const1.0:
    .float 1.0 
    .float 1.0 
    .float 1.0 
    .float 1.0

.data 
.align 16 
.const8.0:
    .float 8.0 
    .float 8.0 
    .float 8.0 
    .float 8.0

.data 
.align 16 
.const0.5:
    .float 0.5 
    .float 0.5 
    .float 0.5 
    .float 0.5

.data 
.align 16 
.const2.0:
    .float 2.0 
    .float 2.0 
    .float 2.0 
    .float 2.0


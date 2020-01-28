
.text
.global assign
.type assign, @function
.p2align 4,,15

assign:
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
.global assignTwo
.type assignTwo, @function
.p2align 4,,15

assignTwo:
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
                                       
    jz .loop_end1

.loop_begin1:
    movaps (%rax), %xmm0        # load source into %xmm0
    movaps %xmm0, (%r10)        # store %xmm0


    addq $16, %r10

    decq %rbx
    jnz .loop_begin1
.loop_end1:

    # load source address into %rax
    
    # place address of 4.0 into %rax
    movq $.const4.0, %rax


    # load destination address into %r10
    
    # place address of parameter into %r10
    movq %rdx, %r10


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
.global assignThree
.type assignThree, @function
.p2align 4,,15

assignThree:
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
    movq %rdx, %rax


    # load destination address into %r10
    
    # place address of parameter into %r10
    movq %rsi, %r10


    movq %rdi, %rbx                    
    shrq $2, %rbx                      
                                       
    jz .loop_end3

.loop_begin3:
    movaps (%rax), %xmm0        # load source into %xmm0
    movaps %xmm0, (%r10)        # store %xmm0


    addq $16, %rax             

    addq $16, %r10

    decq %rbx
    jnz .loop_begin3
.loop_end3:


    popq    %rbx
    leave
    ret

.text
.global assignFour
.type assignFour, @function
.p2align 4,,15

assignFour:
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
    movq %rdx, %rax


    # load destination address into %r10
    
    # place address of parameter into %r10
    movq %rsi, %r10


    movq %rdi, %rbx                    
    shrq $2, %rbx                      
                                       
    jz .loop_end4

.loop_begin4:
    movaps (%rax), %xmm0        # load source into %xmm0
    movaps %xmm0, (%r10)        # store %xmm0


    addq $16, %rax             

    addq $16, %r10

    decq %rbx
    jnz .loop_begin4
.loop_end4:

    # load source address into %rax
    
    # place address of 2.0 into %rax
    movq $.const2.0, %rax


    # load destination address into %r10
    
    # place address of parameter into %r10
    movq %rsi, %r10


    movq %rdi, %rbx                    
    shrq $2, %rbx                      
                                       
    jz .loop_end5

.loop_begin5:
    movaps (%rax), %xmm0        # load source into %xmm0
    movaps %xmm0, (%r10)        # store %xmm0


    addq $16, %r10

    decq %rbx
    jnz .loop_begin5
.loop_end5:

    # load source address into %rax
    
    # place address of parameter into %rax
    movq %rsi, %rax


    # load destination address into %r10
    
    # place address of parameter into %r10
    movq %rdx, %r10


    movq %rdi, %rbx                    
    shrq $2, %rbx                      
                                       
    jz .loop_end6

.loop_begin6:
    movaps (%rax), %xmm0        # load source into %xmm0
    movaps %xmm0, (%r10)        # store %xmm0


    addq $16, %rax             

    addq $16, %r10

    decq %rbx
    jnz .loop_begin6
.loop_end6:


    popq    %rbx
    leave
    ret

.text
.global assignFive
.type assignFive, @function
.p2align 4,,15

assignFive:
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
    movq %rdx, %r10


    movq %rdi, %rbx                    
    shrq $2, %rbx                      
                                       
    jz .loop_end7

.loop_begin7:
    movaps (%rax), %xmm0        # load source into %xmm0
    movaps %xmm0, (%r10)        # store %xmm0


    addq $16, %rax             

    addq $16, %r10

    decq %rbx
    jnz .loop_begin7
.loop_end7:

    # load source address into %rax
    
    # place address of 2.0 into %rax
    movq $.const2.0, %rax


    # load destination address into %r10
    
    # place address of parameter into %r10
    movq %rsi, %r10


    movq %rdi, %rbx                    
    shrq $2, %rbx                      
                                       
    jz .loop_end8

.loop_begin8:
    movaps (%rax), %xmm0        # load source into %xmm0
    movaps %xmm0, (%r10)        # store %xmm0


    addq $16, %r10

    decq %rbx
    jnz .loop_begin8
.loop_end8:

    # load source address into %rax
    
    # place address of parameter into %rax
    movq %rdx, %rax


    # load destination address into %r10
    
    # place address of parameter into %r10
    movq %rsi, %r10


    movq %rdi, %rbx                    
    shrq $2, %rbx                      
                                       
    jz .loop_end9

.loop_begin9:
    movaps (%rax), %xmm0        # load source into %xmm0
    movaps %xmm0, (%r10)        # store %xmm0


    addq $16, %rax             

    addq $16, %r10

    decq %rbx
    jnz .loop_begin9
.loop_end9:


    popq    %rbx
    leave
    ret

.text
.global assignSix
.type assignSix, @function
.p2align 4,,15

assignSix:
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
    movq %rdx, %rax


    # load destination address into %r10
    
    # place address of parameter into %r10
    movq %rsi, %r10


    movq %rdi, %rbx                    
    shrq $2, %rbx                      
                                       
    jz .loop_end10

.loop_begin10:
    movaps (%rax), %xmm0        # load source into %xmm0
    movaps %xmm0, (%r10)        # store %xmm0


    addq $16, %rax             

    addq $16, %r10

    decq %rbx
    jnz .loop_begin10
.loop_end10:

    # load source address into %rax
    
    # place address of parameter into %rax
    movq %rcx, %rax


    # load destination address into %r10
    
    # place address of parameter into %r10
    movq %rdx, %r10


    movq %rdi, %rbx                    
    shrq $2, %rbx                      
                                       
    jz .loop_end11

.loop_begin11:
    movaps (%rax), %xmm0        # load source into %xmm0
    movaps %xmm0, (%r10)        # store %xmm0


    addq $16, %rax             

    addq $16, %r10

    decq %rbx
    jnz .loop_begin11
.loop_end11:

    # load source address into %rax
    
    # place address of 1.0 into %rax
    movq $.const1.0, %rax


    # load destination address into %r10
    
    # place address of parameter into %r10
    movq %rcx, %r10


    movq %rdi, %rbx                    
    shrq $2, %rbx                      
                                       
    jz .loop_end12

.loop_begin12:
    movaps (%rax), %xmm0        # load source into %xmm0
    movaps %xmm0, (%r10)        # store %xmm0


    addq $16, %r10

    decq %rbx
    jnz .loop_begin12
.loop_end12:


    popq    %rbx
    leave
    ret

.text
.global assignSeven
.type assignSeven, @function
.p2align 4,,15

assignSeven:
    pushq   %rbp
    movq    %rsp, %rbp
    pushq   %rbx

    # allocate 1 local variables
    movq %rdi, %rax
    imulq $4, %rax, %rax
    addq $16, %rax
    imulq $1, %rax, %rax
    subq %rax, %rsp
    andq $-16, %rsp

    
    # load source address into %rax
    
    # place address of parameter into %rax
    movq %rsi, %rax


    # load destination address into %r10
    
    # place address of 1th local variable into %r10
    movq %rdi, %r10
    imulq $4, %r10, %r10
    addq $16, %r10
    imulq $1, %r10, %r10
    subq %rbp, %r10
    negq %r10
    andq $-16, %r10


    movq %rdi, %rbx                    
    shrq $2, %rbx                      
                                       
    jz .loop_end13

.loop_begin13:
    movaps (%rax), %xmm0        # load source into %xmm0
    movaps %xmm0, (%r10)        # store %xmm0


    addq $16, %rax             

    addq $16, %r10

    decq %rbx
    jnz .loop_begin13
.loop_end13:

    # load source address into %rax
    
    # place address of parameter into %rax
    movq %rdx, %rax


    # load destination address into %r10
    
    # place address of parameter into %r10
    movq %rsi, %r10


    movq %rdi, %rbx                    
    shrq $2, %rbx                      
                                       
    jz .loop_end14

.loop_begin14:
    movaps (%rax), %xmm0        # load source into %xmm0
    movaps %xmm0, (%r10)        # store %xmm0


    addq $16, %rax             

    addq $16, %r10

    decq %rbx
    jnz .loop_begin14
.loop_end14:

    # load source address into %rax
    
    # place address of 1th local variable into %rax
    movq %rdi, %rax
    imulq $4, %rax, %rax
    addq $16, %rax
    imulq $1, %rax, %rax
    subq %rbp, %rax
    negq %rax
    andq $-16, %rax


    # load destination address into %r10
    
    # place address of parameter into %r10
    movq %rdx, %r10


    movq %rdi, %rbx                    
    shrq $2, %rbx                      
                                       
    jz .loop_end15

.loop_begin15:
    movaps (%rax), %xmm0        # load source into %xmm0
    movaps %xmm0, (%r10)        # store %xmm0


    addq $16, %rax             

    addq $16, %r10

    decq %rbx
    jnz .loop_begin15
.loop_end15:


    popq    %rbx
    leave
    ret

.data 
.align 16 
.const1.0:
    .float 1.0 
    .float 1.0 
    .float 1.0 
    .float 1.0

.data 
.align 16 
.const2.0:
    .float 2.0 
    .float 2.0 
    .float 2.0 
    .float 2.0

.data 
.align 16 
.const4.0:
    .float 4.0 
    .float 4.0 
    .float 4.0 
    .float 4.0


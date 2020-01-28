
.text
.global arith1
.type arith1, @function
.p2align 4,,15

arith1:
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

    
    # load souce1 address into %rax
    
    # place address of parameter into %rax
    movq %rsi, %rax

    # load source2 address into %r10
    
    # place address of parameter into %r10
    movq %rdx, %r10

    # load destination address into %r11
    
    # place address of 1th local variable into %r11
    movq %rdi, %r11
    imulq $4, %r11, %r11
    addq $16, %r11
    imulq $1, %r11, %r11
    subq %rbp, %r11
    negq %r11
    andq $-16, %r11


    movq %rdi, %rbx                    # load vector length into counter %rbx
    shrq $2, %rbx                      # divide counter reg by 4
                                       # (per loop iteration 4 floats)
    jz .loop_end0                    # check whether number is equal to zero

.loop_begin0:
        movaps (%rax), %xmm0           # load first operand into %xmm0
        movaps (%r10), %xmm1           # load second operand into %xmm1

        # perform operation
        addps %xmm1, %xmm0    

        movaps %xmm0, (%r11)           # store result

        # increment pointers
        
    addq $16, %rax

        
    addq $16, %r10


        addq $16, %r11                 

        decq %rbx                      # decrement counter
        jnz .loop_begin0             # jump to loop header if counter is not zero
.loop_end0:

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
    movq %rcx, %r10


    movq %rdi, %rbx                    
    shrq $2, %rbx                      
                                       
    jz .loop_end1

.loop_begin1:
    movaps (%rax), %xmm0        # load source into %xmm0
    movaps %xmm0, (%r10)        # store %xmm0


    addq $16, %rax             

    addq $16, %r10

    decq %rbx
    jnz .loop_begin1
.loop_end1:


    popq    %rbx
    leave
    ret

.text
.global arith2
.type arith2, @function
.p2align 4,,15

arith2:
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

    
    # load souce1 address into %rax
    
    # place address of parameter into %rax
    movq %rsi, %rax

    # load source2 address into %r10
    
    # place address of parameter into %r10
    movq %rdx, %r10

    # load destination address into %r11
    
    # place address of 1th local variable into %r11
    movq %rdi, %r11
    imulq $4, %r11, %r11
    addq $16, %r11
    imulq $1, %r11, %r11
    subq %rbp, %r11
    negq %r11
    andq $-16, %r11


    movq %rdi, %rbx                    # load vector length into counter %rbx
    shrq $2, %rbx                      # divide counter reg by 4
                                       # (per loop iteration 4 floats)
    jz .loop_end2                    # check whether number is equal to zero

.loop_begin2:
        movaps (%rax), %xmm0           # load first operand into %xmm0
        movaps (%r10), %xmm1           # load second operand into %xmm1

        # perform operation
        subps %xmm1, %xmm0    

        movaps %xmm0, (%r11)           # store result

        # increment pointers
        
    addq $16, %rax

        
    addq $16, %r10


        addq $16, %r11                 

        decq %rbx                      # decrement counter
        jnz .loop_begin2             # jump to loop header if counter is not zero
.loop_end2:

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
    movq %rcx, %r10


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
.global arith3
.type arith3, @function
.p2align 4,,15

arith3:
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

    
    # load souce1 address into %rax
    
    # place address of parameter into %rax
    movq %rsi, %rax

    # load source2 address into %r10
    
    # place address of parameter into %r10
    movq %rdx, %r10

    # load destination address into %r11
    
    # place address of 1th local variable into %r11
    movq %rdi, %r11
    imulq $4, %r11, %r11
    addq $16, %r11
    imulq $1, %r11, %r11
    subq %rbp, %r11
    negq %r11
    andq $-16, %r11


    movq %rdi, %rbx                    # load vector length into counter %rbx
    shrq $2, %rbx                      # divide counter reg by 4
                                       # (per loop iteration 4 floats)
    jz .loop_end4                    # check whether number is equal to zero

.loop_begin4:
        movaps (%rax), %xmm0           # load first operand into %xmm0
        movaps (%r10), %xmm1           # load second operand into %xmm1

        # perform operation
        mulps %xmm1, %xmm0    

        movaps %xmm0, (%r11)           # store result

        # increment pointers
        
    addq $16, %rax

        
    addq $16, %r10


        addq $16, %r11                 

        decq %rbx                      # decrement counter
        jnz .loop_begin4             # jump to loop header if counter is not zero
.loop_end4:

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
    movq %rcx, %r10


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

.text
.global arith4
.type arith4, @function
.p2align 4,,15

arith4:
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

    
    # load souce1 address into %rax
    
    # place address of parameter into %rax
    movq %rsi, %rax

    # load source2 address into %r10
    
    # place address of parameter into %r10
    movq %rdx, %r10

    # load destination address into %r11
    
    # place address of 1th local variable into %r11
    movq %rdi, %r11
    imulq $4, %r11, %r11
    addq $16, %r11
    imulq $1, %r11, %r11
    subq %rbp, %r11
    negq %r11
    andq $-16, %r11


    movq %rdi, %rbx                    # load vector length into counter %rbx
    shrq $2, %rbx                      # divide counter reg by 4
                                       # (per loop iteration 4 floats)
    jz .loop_end6                    # check whether number is equal to zero

.loop_begin6:
        movaps (%rax), %xmm0           # load first operand into %xmm0
        movaps (%r10), %xmm1           # load second operand into %xmm1

        # perform operation
        divps %xmm1, %xmm0    

        movaps %xmm0, (%r11)           # store result

        # increment pointers
        
    addq $16, %rax

        
    addq $16, %r10


        addq $16, %r11                 

        decq %rbx                      # decrement counter
        jnz .loop_begin6             # jump to loop header if counter is not zero
.loop_end6:

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
    movq %rcx, %r10


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


    popq    %rbx
    leave
    ret

.text
.global arith5
.type arith5, @function
.p2align 4,,15

arith5:
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

    
    # load souce1 address into %rax
    
    # place address of parameter into %rax
    movq %rsi, %rax

    # load source2 address into %r10
    
    # place address of parameter into %r10
    movq %rdx, %r10

    # load destination address into %r11
    
    # place address of 1th local variable into %r11
    movq %rdi, %r11
    imulq $4, %r11, %r11
    addq $16, %r11
    imulq $1, %r11, %r11
    subq %rbp, %r11
    negq %r11
    andq $-16, %r11


    movq %rdi, %rbx                    # load vector length into counter %rbx
    shrq $2, %rbx                      # divide counter reg by 4
                                       # (per loop iteration 4 floats)
    jz .loop_end8                    # check whether number is equal to zero

.loop_begin8:
        movaps (%rax), %xmm0           # load first operand into %xmm0
        movaps (%r10), %xmm1           # load second operand into %xmm1

        # perform operation
        minps %xmm1, %xmm0    

        movaps %xmm0, (%r11)           # store result

        # increment pointers
        
    addq $16, %rax

        
    addq $16, %r10


        addq $16, %r11                 

        decq %rbx                      # decrement counter
        jnz .loop_begin8             # jump to loop header if counter is not zero
.loop_end8:

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
    movq %rcx, %r10


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
.global arith6
.type arith6, @function
.p2align 4,,15

arith6:
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

    
    # load souce1 address into %rax
    
    # place address of parameter into %rax
    movq %rsi, %rax

    # load source2 address into %r10
    
    # place address of parameter into %r10
    movq %rdx, %r10

    # load destination address into %r11
    
    # place address of 1th local variable into %r11
    movq %rdi, %r11
    imulq $4, %r11, %r11
    addq $16, %r11
    imulq $1, %r11, %r11
    subq %rbp, %r11
    negq %r11
    andq $-16, %r11


    movq %rdi, %rbx                    # load vector length into counter %rbx
    shrq $2, %rbx                      # divide counter reg by 4
                                       # (per loop iteration 4 floats)
    jz .loop_end10                    # check whether number is equal to zero

.loop_begin10:
        movaps (%rax), %xmm0           # load first operand into %xmm0
        movaps (%r10), %xmm1           # load second operand into %xmm1

        # perform operation
        addps %xmm1, %xmm0    

        movaps %xmm0, (%r11)           # store result

        # increment pointers
        
    addq $16, %rax

        
    addq $16, %r10


        addq $16, %r11                 

        decq %rbx                      # decrement counter
        jnz .loop_begin10             # jump to loop header if counter is not zero
.loop_end10:

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
    movq %rcx, %r10


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


    popq    %rbx
    leave
    ret



.text
.global ifwhileOne
.type ifwhileOne, @function
.p2align 4,,15

ifwhileOne:
    pushq   %rbp
    movq    %rsp, %rbp
    pushq   %rbx

    # allocate 2 local variables
    movq %rdi, %rax
    imulq $4, %rax, %rax
    addq $16, %rax
    imulq $2, %rax, %rax
    subq %rax, %rsp
    andq $-16, %rsp

    

    # Condition
	
    # <load source address into %rax> 
    
    # place address of parameter into %rax
    movq %rsi, %rax


    xorps %xmm1, %xmm1
    movq %rdi, %rbx
    shrq $2, %rbx

    jz .loop_end1

.loop_begin1:

    addps (%rax), %xmm1 
    
    # exist when %rax is not pointing to constant
    addq $16, %rax

    decq %rbx
    jnz .loop_begin1

.loop_end1:
    xorps %xmm0, %xmm0
    addss %xmm1,%xmm0
    shufps $147,%xmm1,%xmm1
    addss %xmm1,%xmm0
    shufps $147,%xmm1,%xmm1
    addss %xmm1,%xmm0
    shufps $147,%xmm1,%xmm1
    addss %xmm1,%xmm0

    ucomiss .L7.0, %xmm0
    jb .falsebranch0
    jmp .truebranch0


    .align 4
.L7.0:
    .float 7.0



.truebranch0:

##### While begin #####
jmp .loopcond2

.loopbegin2:
# while body

    # load souce1 address into %rax
    
    # place address of parameter into %rax
    movq %rsi, %rax

    # load source2 address into %r10
    
    # place address of 1.0 into %r10
    movq $.const1.0, %r10

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
        subps %xmm1, %xmm0    

        movaps %xmm0, (%r11)           # store result

        # increment pointers
        
    addq $16, %rax

        

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

    # load souce1 address into %rax
    
    # place address of parameter into %rax
    movq %rdx, %rax

    # load source2 address into %r10
    
    # place address of 1.0 into %r10
    movq $.const1.0, %r10

    # load destination address into %r11
    
    # place address of 2th local variable into %r11
    movq %rdi, %r11
    imulq $4, %r11, %r11
    addq $16, %r11
    imulq $2, %r11, %r11
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
        subps %xmm1, %xmm0    

        movaps %xmm0, (%r11)           # store result

        # increment pointers
        
    addq $16, %rax

        

        addq $16, %r11                 

        decq %rbx                      # decrement counter
        jnz .loop_begin6             # jump to loop header if counter is not zero
.loop_end6:

    # load source address into %rax
    
    # place address of 2th local variable into %rax
    movq %rdi, %rax
    imulq $4, %rax, %rax
    addq $16, %rax
    imulq $2, %rax, %rax
    subq %rbp, %rax
    negq %rax
    andq $-16, %rax


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


# while condition
.loopcond2:

    # Condition
	
    # <load source address into %rax> 
    
    # place address of parameter into %rax
    movq %rsi, %rax


    xorps %xmm1, %xmm1
    movq %rdi, %rbx
    shrq $2, %rbx

    jz .loop_end3

.loop_begin3:

    addps (%rax), %xmm1 
    
    # exist when %rax is not pointing to constant
    addq $16, %rax

    decq %rbx
    jnz .loop_begin3

.loop_end3:
    xorps %xmm0, %xmm0
    addss %xmm1,%xmm0
    shufps $147,%xmm1,%xmm1
    addss %xmm1,%xmm0
    shufps $147,%xmm1,%xmm1
    addss %xmm1,%xmm0
    shufps $147,%xmm1,%xmm1
    addss %xmm1,%xmm0

    ucomiss .L2.0, %xmm0
    jb .loopexit2
    jmp .loopbegin2


    .align 4
.L2.0:
    .float 2.0



.loopexit2:


	jmp .endif0

.falsebranch0:

.endif0:


    popq    %rbx
    leave
    ret

.text
.global ifwhileTwo
.type ifwhileTwo, @function
.p2align 4,,15

ifwhileTwo:
    pushq   %rbp
    movq    %rsp, %rbp
    pushq   %rbx

    # allocate 2 local variables
    movq %rdi, %rax
    imulq $4, %rax, %rax
    addq $16, %rax
    imulq $2, %rax, %rax
    subq %rax, %rsp
    andq $-16, %rsp

    
##### While begin #####
jmp .loopcond8

.loopbegin8:
# while body


    # Condition
	
    # <load source address into %rax> 
    
    # place address of parameter into %rax
    movq %rsi, %rax


    xorps %xmm1, %xmm1
    movq %rdi, %rbx
    shrq $2, %rbx

    jz .loop_end11

.loop_begin11:

    addps (%rax), %xmm1 
    
    # exist when %rax is not pointing to constant
    addq $16, %rax

    decq %rbx
    jnz .loop_begin11

.loop_end11:
    xorps %xmm0, %xmm0
    addss %xmm1,%xmm0
    shufps $147,%xmm1,%xmm1
    addss %xmm1,%xmm0
    shufps $147,%xmm1,%xmm1
    addss %xmm1,%xmm0
    shufps $147,%xmm1,%xmm1
    addss %xmm1,%xmm0

    ucomiss .L9.0, %xmm0
    jb .truebranch10
    jmp .falsebranch10


    .align 4
.L9.0:
    .float 9.0



.truebranch10:

    # load souce1 address into %rax
    
    # place address of parameter into %rax
    movq %rsi, %rax

    # load source2 address into %r10
    
    # place address of 1.0 into %r10
    movq $.const1.0, %r10

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
    jz .loop_end12                    # check whether number is equal to zero

.loop_begin12:
        movaps (%rax), %xmm0           # load first operand into %xmm0
        movaps (%r10), %xmm1           # load second operand into %xmm1

        # perform operation
        addps %xmm1, %xmm0    

        movaps %xmm0, (%r11)           # store result

        # increment pointers
        
    addq $16, %rax

        

        addq $16, %r11                 

        decq %rbx                      # decrement counter
        jnz .loop_begin12             # jump to loop header if counter is not zero
.loop_end12:

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
    movq %rsi, %r10


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

    # load souce1 address into %rax
    
    # place address of parameter into %rax
    movq %rsi, %rax

    # load source2 address into %r10
    
    # place address of 2.0 into %r10
    movq $.const2.0, %r10

    # load destination address into %r11
    
    # place address of 2th local variable into %r11
    movq %rdi, %r11
    imulq $4, %r11, %r11
    addq $16, %r11
    imulq $2, %r11, %r11
    subq %rbp, %r11
    negq %r11
    andq $-16, %r11


    movq %rdi, %rbx                    # load vector length into counter %rbx
    shrq $2, %rbx                      # divide counter reg by 4
                                       # (per loop iteration 4 floats)
    jz .loop_end14                    # check whether number is equal to zero

.loop_begin14:
        movaps (%rax), %xmm0           # load first operand into %xmm0
        movaps (%r10), %xmm1           # load second operand into %xmm1

        # perform operation
        mulps %xmm1, %xmm0    

        movaps %xmm0, (%r11)           # store result

        # increment pointers
        
    addq $16, %rax

        

        addq $16, %r11                 

        decq %rbx                      # decrement counter
        jnz .loop_begin14             # jump to loop header if counter is not zero
.loop_end14:

    # load source address into %rax
    
    # place address of 2th local variable into %rax
    movq %rdi, %rax
    imulq $4, %rax, %rax
    addq $16, %rax
    imulq $2, %rax, %rax
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


	jmp .endif10

.falsebranch10:

.endif10:


# while condition
.loopcond8:

    # Condition
	
    # <load source address into %rax> 
    
    # place address of parameter into %rax
    movq %rdx, %rax


    xorps %xmm1, %xmm1
    movq %rdi, %rbx
    shrq $2, %rbx

    jz .loop_end9

.loop_begin9:

    addps (%rax), %xmm1 
    
    # exist when %rax is not pointing to constant
    addq $16, %rax

    decq %rbx
    jnz .loop_begin9

.loop_end9:
    xorps %xmm0, %xmm0
    addss %xmm1,%xmm0
    shufps $147,%xmm1,%xmm1
    addss %xmm1,%xmm0
    shufps $147,%xmm1,%xmm1
    addss %xmm1,%xmm0
    shufps $147,%xmm1,%xmm1
    addss %xmm1,%xmm0

    ucomiss .L13.0, %xmm0
    jb .loopbegin8
    jmp .loopexit8


    .align 4
.L13.0:
    .float 13.0



.loopexit8:


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


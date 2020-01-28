
.text
.global complexTwo
.type complexTwo, @function
.p2align 4,,15

complexTwo:
    pushq   %rbp
    movq    %rsp, %rbp
    pushq   %rbx

    # allocate 5 local variables
    movq %rdi, %rax
    imulq $4, %rax, %rax
    addq $16, %rax
    imulq $5, %rax, %rax
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

    ucomiss .L3.0, %xmm0
    jb .truebranch0
    jmp .falsebranch0


    .align 4
.L3.0:
    .float 3.0



.truebranch0:


    # Condition
	
    # <load source address into %rax> 
    
    # place address of parameter into %rax
    movq %rdx, %rax


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

    ucomiss .L4.0, %xmm0
    jb .falsebranch2
    jmp .truebranch2


    .align 4
.L4.0:
    .float 4.0



.truebranch2:

    # load souce1 address into %rax
    
    # place address of parameter into %rax
    movq %rdx, %rax

    # load source2 address into %r10
    
    # place address of parameter into %r10
    movq %rsi, %r10

    # load destination address into %r11
    
    # place address of 3th local variable into %r11
    movq %rdi, %r11
    imulq $4, %r11, %r11
    addq $16, %r11
    imulq $3, %r11, %r11
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
        minps %xmm1, %xmm0    

        movaps %xmm0, (%r11)           # store result

        # increment pointers
        
    addq $16, %rax

        
    addq $16, %r10


        addq $16, %r11                 

        decq %rbx                      # decrement counter
        jnz .loop_begin4             # jump to loop header if counter is not zero
.loop_end4:

    # load souce1 address into %rax
    
    # place address of 3th local variable into %rax
    movq %rdi, %rax
    imulq $4, %rax, %rax
    addq $16, %rax
    imulq $3, %rax, %rax
    subq %rbp, %rax
    negq %rax
    andq $-16, %rax

    # load source2 address into %r10
    
    # place address of parameter into %r10
    movq %rsi, %r10

    # load destination address into %r11
    
    # place address of 4th local variable into %r11
    movq %rdi, %r11
    imulq $4, %r11, %r11
    addq $16, %r11
    imulq $4, %r11, %r11
    subq %rbp, %r11
    negq %r11
    andq $-16, %r11


    movq %rdi, %rbx                    # load vector length into counter %rbx
    shrq $2, %rbx                      # divide counter reg by 4
                                       # (per loop iteration 4 floats)
    jz .loop_end5                    # check whether number is equal to zero

.loop_begin5:
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
        jnz .loop_begin5             # jump to loop header if counter is not zero
.loop_end5:

    # load source address into %rax
    
    # place address of 4th local variable into %rax
    movq %rdi, %rax
    imulq $4, %rax, %rax
    addq $16, %rax
    imulq $4, %rax, %rax
    subq %rbp, %rax
    negq %rax
    andq $-16, %rax


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
                                       
    jz .loop_end6

.loop_begin6:
    movaps (%rax), %xmm0        # load source into %xmm0
    movaps %xmm0, (%r10)        # store %xmm0


    addq $16, %rax             

    addq $16, %r10

    decq %rbx
    jnz .loop_begin6
.loop_end6:

    # load source address into %rax
    
    # place address of 5.6 into %rax
    movq $.const5.6, %rax


    # load destination address into %r10
    
    # place address of 2th local variable into %r10
    movq %rdi, %r10
    imulq $4, %r10, %r10
    addq $16, %r10
    imulq $2, %r10, %r10
    subq %rbp, %r10
    negq %r10
    andq $-16, %r10


    movq %rdi, %rbx                    
    shrq $2, %rbx                      
                                       
    jz .loop_end7

.loop_begin7:
    movaps (%rax), %xmm0        # load source into %xmm0
    movaps %xmm0, (%r10)        # store %xmm0


    addq $16, %r10

    decq %rbx
    jnz .loop_begin7
.loop_end7:


	jmp .endif2

.falsebranch2:

.endif2:

##### While begin #####
jmp .loopcond8

.loopbegin8:
# while body

    # load souce1 address into %rax
    
    # place address of 1th local variable into %rax
    movq %rdi, %rax
    imulq $4, %rax, %rax
    addq $16, %rax
    imulq $1, %rax, %rax
    subq %rbp, %rax
    negq %rax
    andq $-16, %rax

    # load source2 address into %r10
    
    # place address of 1.0 into %r10
    movq $.const1.0, %r10

    # load destination address into %r11
    
    # place address of 5th local variable into %r11
    movq %rdi, %r11
    imulq $4, %r11, %r11
    addq $16, %r11
    imulq $5, %r11, %r11
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
        subps %xmm1, %xmm0    

        movaps %xmm0, (%r11)           # store result

        # increment pointers
        
    addq $16, %rax

        

        addq $16, %r11                 

        decq %rbx                      # decrement counter
        jnz .loop_begin10             # jump to loop header if counter is not zero
.loop_end10:

    # load source address into %rax
    
    # place address of 5th local variable into %rax
    movq %rdi, %rax
    imulq $4, %rax, %rax
    addq $16, %rax
    imulq $5, %rax, %rax
    subq %rbp, %rax
    negq %rax
    andq $-16, %rax


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
                                       
    jz .loop_end11

.loop_begin11:
    movaps (%rax), %xmm0        # load source into %xmm0
    movaps %xmm0, (%r10)        # store %xmm0


    addq $16, %rax             

    addq $16, %r10

    decq %rbx
    jnz .loop_begin11
.loop_end11:


# while condition
.loopcond8:

    # Condition
	
    # <load source address into %rax> 
    
    # place address of 1th local variable into %rax
    movq %rdi, %rax
    imulq $4, %rax, %rax
    addq $16, %rax
    imulq $1, %rax, %rax
    subq %rbp, %rax
    negq %rax
    andq $-16, %rax


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

    ucomiss .L1.0, %xmm0
    jb .loopexit8
    jmp .loopbegin8


    .align 4
.L1.0:
    .float 1.0



.loopexit8:


	jmp .endif0

.falsebranch0:

.endif0:


    popq    %rbx
    leave
    ret

.text
.global complexThree
.type complexThree, @function
.p2align 4,,15

complexThree:
    pushq   %rbp
    movq    %rsp, %rbp
    pushq   %rbx

    # allocate 3 local variables
    movq %rdi, %rax
    imulq $4, %rax, %rax
    addq $16, %rax
    imulq $3, %rax, %rax
    subq %rax, %rsp
    andq $-16, %rsp

    
##### While begin #####
jmp .loopcond12

.loopbegin12:
# while body

    # load souce1 address into %rax
    
    # place address of parameter into %rax
    movq %rdx, %rax

    # load source2 address into %r10
    
    # place address of parameter into %r10
    movq %rsi, %r10

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

        
    addq $16, %r10


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
                                       
    jz .loop_end15

.loop_begin15:
    movaps (%rax), %xmm0        # load source into %xmm0
    movaps %xmm0, (%r10)        # store %xmm0


    addq $16, %rax             

    addq $16, %r10

    decq %rbx
    jnz .loop_begin15
.loop_end15:

    # load souce1 address into %rax
    
    # place address of parameter into %rax
    movq %rsi, %rax

    # load source2 address into %r10
    
    # place address of 1.0 into %r10
    movq $.const1.0, %r10

    # load destination address into %r11
    
    # place address of 3th local variable into %r11
    movq %rdi, %r11
    imulq $4, %r11, %r11
    addq $16, %r11
    imulq $3, %r11, %r11
    subq %rbp, %r11
    negq %r11
    andq $-16, %r11


    movq %rdi, %rbx                    # load vector length into counter %rbx
    shrq $2, %rbx                      # divide counter reg by 4
                                       # (per loop iteration 4 floats)
    jz .loop_end16                    # check whether number is equal to zero

.loop_begin16:
        movaps (%rax), %xmm0           # load first operand into %xmm0
        movaps (%r10), %xmm1           # load second operand into %xmm1

        # perform operation
        subps %xmm1, %xmm0    

        movaps %xmm0, (%r11)           # store result

        # increment pointers
        
    addq $16, %rax

        

        addq $16, %r11                 

        decq %rbx                      # decrement counter
        jnz .loop_begin16             # jump to loop header if counter is not zero
.loop_end16:

    # load source address into %rax
    
    # place address of 3th local variable into %rax
    movq %rdi, %rax
    imulq $4, %rax, %rax
    addq $16, %rax
    imulq $3, %rax, %rax
    subq %rbp, %rax
    negq %rax
    andq $-16, %rax


    # load destination address into %r10
    
    # place address of parameter into %r10
    movq %rsi, %r10


    movq %rdi, %rbx                    
    shrq $2, %rbx                      
                                       
    jz .loop_end17

.loop_begin17:
    movaps (%rax), %xmm0        # load source into %xmm0
    movaps %xmm0, (%r10)        # store %xmm0


    addq $16, %rax             

    addq $16, %r10

    decq %rbx
    jnz .loop_begin17
.loop_end17:


# while condition
.loopcond12:

    # Condition
	
    # <load source address into %rax> 
    
    # place address of parameter into %rax
    movq %rsi, %rax


    xorps %xmm1, %xmm1
    movq %rdi, %rbx
    shrq $2, %rbx

    jz .loop_end13

.loop_begin13:

    addps (%rax), %xmm1 
    
    # exist when %rax is not pointing to constant
    addq $16, %rax

    decq %rbx
    jnz .loop_begin13

.loop_end13:
    xorps %xmm0, %xmm0
    addss %xmm1,%xmm0
    shufps $147,%xmm1,%xmm1
    addss %xmm1,%xmm0
    shufps $147,%xmm1,%xmm1
    addss %xmm1,%xmm0
    shufps $147,%xmm1,%xmm1
    addss %xmm1,%xmm0

    ucomiss .L3.0, %xmm0
    jb .loopexit12
    jmp .loopbegin12




.loopexit12:


    # Condition
	
    # <load source address into %rax> 
    
    # place address of 1th local variable into %rax
    movq %rdi, %rax
    imulq $4, %rax, %rax
    addq $16, %rax
    imulq $1, %rax, %rax
    subq %rbp, %rax
    negq %rax
    andq $-16, %rax


    xorps %xmm1, %xmm1
    movq %rdi, %rbx
    shrq $2, %rbx

    jz .loop_end19

.loop_begin19:

    addps (%rax), %xmm1 
    
    # exist when %rax is not pointing to constant
    addq $16, %rax

    decq %rbx
    jnz .loop_begin19

.loop_end19:
    xorps %xmm0, %xmm0
    addss %xmm1,%xmm0
    shufps $147,%xmm1,%xmm1
    addss %xmm1,%xmm0
    shufps $147,%xmm1,%xmm1
    addss %xmm1,%xmm0
    shufps $147,%xmm1,%xmm1
    addss %xmm1,%xmm0

    ucomiss .L20.0, %xmm0
    jb .truebranch18
    jmp .falsebranch18


    .align 4
.L20.0:
    .float 20.0



.truebranch18:

    # load source address into %rax
    
    # place address of 1.0 into %rax
    movq $.const1.0, %rax


    # load destination address into %r10
    
    # place address of parameter into %r10
    movq %rcx, %r10


    movq %rdi, %rbx                    
    shrq $2, %rbx                      
                                       
    jz .loop_end20

.loop_begin20:
    movaps (%rax), %xmm0        # load source into %xmm0
    movaps %xmm0, (%r10)        # store %xmm0


    addq $16, %r10

    decq %rbx
    jnz .loop_begin20
.loop_end20:


	jmp .endif18

.falsebranch18:

.endif18:


    popq    %rbx
    leave
    ret

.data 
.align 16 
.const5.6:
    .float 5.6 
    .float 5.6 
    .float 5.6 
    .float 5.6

.data 
.align 16 
.const1.0:
    .float 1.0 
    .float 1.0 
    .float 1.0 
    .float 1.0


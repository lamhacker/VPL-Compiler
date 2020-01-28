
.text
.global complexOne
.type complexOne, @function
.p2align 4,,15

complexOne:
    pushq   %rbp
    movq    %rsp, %rbp
    pushq   %rbx

    # allocate 4 local variables
    movq %rdi, %rax
    imulq $4, %rax, %rax
    addq $16, %rax
    imulq $4, %rax, %rax
    subq %rax, %rsp
    andq $-16, %rsp

    
    # load source address into %rax
    
    # place address of 1.0 into %rax
    movq $.const1.0, %rax


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
                                       
    jz .loop_end0

.loop_begin0:
    movaps (%rax), %xmm0        # load source into %xmm0
    movaps %xmm0, (%r10)        # store %xmm0


    addq $16, %r10

    decq %rbx
    jnz .loop_begin0
.loop_end0:

    # load souce1 address into %rax
    
    # place address of parameter into %rax
    movq %rsi, %rax

    # load source2 address into %r10
    
    # place address of parameter into %r10
    movq %rdx, %r10

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
    jz .loop_end1                    # check whether number is equal to zero

.loop_begin1:
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
        jnz .loop_begin1             # jump to loop header if counter is not zero
.loop_end1:

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
                                       
    jz .loop_end2

.loop_begin2:
    movaps (%rax), %xmm0        # load source into %xmm0
    movaps %xmm0, (%r10)        # store %xmm0


    addq $16, %rax             

    addq $16, %r10

    decq %rbx
    jnz .loop_begin2
.loop_end2:


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

    jz .loop_end4

.loop_begin4:

    addps (%rax), %xmm1 
    
    # exist when %rax is not pointing to constant
    addq $16, %rax

    decq %rbx
    jnz .loop_begin4

.loop_end4:
    xorps %xmm0, %xmm0
    addss %xmm1,%xmm0
    shufps $147,%xmm1,%xmm1
    addss %xmm1,%xmm0
    shufps $147,%xmm1,%xmm1
    addss %xmm1,%xmm0
    shufps $147,%xmm1,%xmm1
    addss %xmm1,%xmm0

    ucomiss .L2.0, %xmm0
    jb .truebranch3
    jmp .falsebranch3


    .align 4
.L2.0:
    .float 2.0



.truebranch3:

##### While begin #####
jmp .loopcond5

.loopbegin5:
# while body

    # load souce1 address into %rax
    
    # place address of 2.0 into %rax
    movq $.const2.0, %rax

    # load source2 address into %r10
    
    # place address of parameter into %r10
    movq %rcx, %r10

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
    jz .loop_end7                    # check whether number is equal to zero

.loop_begin7:
        movaps (%rax), %xmm0           # load first operand into %xmm0
        movaps (%r10), %xmm1           # load second operand into %xmm1

        # perform operation
        minps %xmm1, %xmm0    

        movaps %xmm0, (%r11)           # store result

        # increment pointers
        
        
    addq $16, %r10


        addq $16, %r11                 

        decq %rbx                      # decrement counter
        jnz .loop_begin7             # jump to loop header if counter is not zero
.loop_end7:

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
                                       
    jz .loop_end8

.loop_begin8:
    movaps (%rax), %xmm0        # load source into %xmm0
    movaps %xmm0, (%r10)        # store %xmm0


    addq $16, %rax             

    addq $16, %r10

    decq %rbx
    jnz .loop_begin8
.loop_end8:


# while condition
.loopcond5:

    # Condition
	
    # <load source address into %rax> 
    
    # place address of 2th local variable into %rax
    movq %rdi, %rax
    imulq $4, %rax, %rax
    addq $16, %rax
    imulq $2, %rax, %rax
    subq %rbp, %rax
    negq %rax
    andq $-16, %rax


    xorps %xmm1, %xmm1
    movq %rdi, %rbx
    shrq $2, %rbx

    jz .loop_end6

.loop_begin6:

    addps (%rax), %xmm1 
    
    # exist when %rax is not pointing to constant
    addq $16, %rax

    decq %rbx
    jnz .loop_begin6

.loop_end6:
    xorps %xmm0, %xmm0
    addss %xmm1,%xmm0
    shufps $147,%xmm1,%xmm1
    addss %xmm1,%xmm0
    shufps $147,%xmm1,%xmm1
    addss %xmm1,%xmm0
    shufps $147,%xmm1,%xmm1
    addss %xmm1,%xmm0

    ucomiss .L3.0, %xmm0
    jb .loopexit5
    jmp .loopbegin5


    .align 4
.L3.0:
    .float 3.0



.loopexit5:


	jmp .endif3

.falsebranch3:

.endif3:


    popq    %rbx
    leave
    ret

.text
.global complexTwo
.type complexTwo, @function
.p2align 4,,15

complexTwo:
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
jmp .loopcond9

.loopbegin9:
# while body

    # load souce1 address into %rax
    
    # place address of parameter into %rax
    movq %rcx, %rax

    # load source2 address into %r10
    
    # place address of 3.0 into %r10
    movq $.const3.0, %r10

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
    jz .loop_end11                    # check whether number is equal to zero

.loop_begin11:
        movaps (%rax), %xmm0           # load first operand into %xmm0
        movaps (%r10), %xmm1           # load second operand into %xmm1

        # perform operation
        mulps %xmm1, %xmm0    

        movaps %xmm0, (%r11)           # store result

        # increment pointers
        
    addq $16, %rax

        

        addq $16, %r11                 

        decq %rbx                      # decrement counter
        jnz .loop_begin11             # jump to loop header if counter is not zero
.loop_end11:

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
    
    # place address of 3th local variable into %r10
    movq %rdi, %r10
    imulq $4, %r10, %r10
    addq $16, %r10
    imulq $3, %r10, %r10
    subq %rbp, %r10
    negq %r10
    andq $-16, %r10


    movq %rdi, %rbx                    
    shrq $2, %rbx                      
                                       
    jz .loop_end12

.loop_begin12:
    movaps (%rax), %xmm0        # load source into %xmm0
    movaps %xmm0, (%r10)        # store %xmm0


    addq $16, %rax             

    addq $16, %r10

    decq %rbx
    jnz .loop_begin12
.loop_end12:


    # Condition
	
    # <load source address into %rax> 
    
    # place address of 3th local variable into %rax
    movq %rdi, %rax
    imulq $4, %rax, %rax
    addq $16, %rax
    imulq $3, %rax, %rax
    subq %rbp, %rax
    negq %rax
    andq $-16, %rax


    xorps %xmm1, %xmm1
    movq %rdi, %rbx
    shrq $2, %rbx

    jz .loop_end14

.loop_begin14:

    addps (%rax), %xmm1 
    
    # exist when %rax is not pointing to constant
    addq $16, %rax

    decq %rbx
    jnz .loop_begin14

.loop_end14:
    xorps %xmm0, %xmm0
    addss %xmm1,%xmm0
    shufps $147,%xmm1,%xmm1
    addss %xmm1,%xmm0
    shufps $147,%xmm1,%xmm1
    addss %xmm1,%xmm0
    shufps $147,%xmm1,%xmm1
    addss %xmm1,%xmm0

    ucomiss .L5.0, %xmm0
    jb .falsebranch13
    jmp .truebranch13


    .align 4
.L5.0:
    .float 5.0



.truebranch13:

    # load souce1 address into %rax
    
    # place address of 7.0 into %rax
    movq $.const7.0, %rax

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
    jz .loop_end15                    # check whether number is equal to zero

.loop_begin15:
        movaps (%rax), %xmm0           # load first operand into %xmm0
        movaps (%r10), %xmm1           # load second operand into %xmm1

        # perform operation
        divps %xmm1, %xmm0    

        movaps %xmm0, (%r11)           # store result

        # increment pointers
        
        
    addq $16, %r10


        addq $16, %r11                 

        decq %rbx                      # decrement counter
        jnz .loop_begin15             # jump to loop header if counter is not zero
.loop_end15:

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
                                       
    jz .loop_end16

.loop_begin16:
    movaps (%rax), %xmm0        # load source into %xmm0
    movaps %xmm0, (%r10)        # store %xmm0


    addq $16, %rax             

    addq $16, %r10

    decq %rbx
    jnz .loop_begin16
.loop_end16:


	jmp .endif13

.falsebranch13:

.endif13:


# while condition
.loopcond9:

    # Condition
	
    # <load source address into %rax> 
    
    # place address of parameter into %rax
    movq %rsi, %rax


    xorps %xmm1, %xmm1
    movq %rdi, %rbx
    shrq $2, %rbx

    jz .loop_end10

.loop_begin10:

    addps (%rax), %xmm1 
    
    # exist when %rax is not pointing to constant
    addq $16, %rax

    decq %rbx
    jnz .loop_begin10

.loop_end10:
    xorps %xmm0, %xmm0
    addss %xmm1,%xmm0
    shufps $147,%xmm1,%xmm1
    addss %xmm1,%xmm0
    shufps $147,%xmm1,%xmm1
    addss %xmm1,%xmm0
    shufps $147,%xmm1,%xmm1
    addss %xmm1,%xmm0

    ucomiss .L2.0, %xmm0
    jb .loopexit9
    jmp .loopbegin9




.loopexit9:


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

    # allocate 4 local variables
    movq %rdi, %rax
    imulq $4, %rax, %rax
    addq $16, %rax
    imulq $4, %rax, %rax
    subq %rax, %rsp
    andq $-16, %rsp

    
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
    jz .loop_end17                    # check whether number is equal to zero

.loop_begin17:
        movaps (%rax), %xmm0           # load first operand into %xmm0
        movaps (%r10), %xmm1           # load second operand into %xmm1

        # perform operation
        subps %xmm1, %xmm0    

        movaps %xmm0, (%r11)           # store result

        # increment pointers
        
    addq $16, %rax

        

        addq $16, %r11                 

        decq %rbx                      # decrement counter
        jnz .loop_begin17             # jump to loop header if counter is not zero
.loop_end17:

    # load souce1 address into %rax
    
    # place address of 2th local variable into %rax
    movq %rdi, %rax
    imulq $4, %rax, %rax
    addq $16, %rax
    imulq $2, %rax, %rax
    subq %rbp, %rax
    negq %rax
    andq $-16, %rax

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
    jz .loop_end18                    # check whether number is equal to zero

.loop_begin18:
        movaps (%rax), %xmm0           # load first operand into %xmm0
        movaps (%r10), %xmm1           # load second operand into %xmm1

        # perform operation
        addps %xmm1, %xmm0    

        movaps %xmm0, (%r11)           # store result

        # increment pointers
        
    addq $16, %rax

        

        addq $16, %r11                 

        decq %rbx                      # decrement counter
        jnz .loop_begin18             # jump to loop header if counter is not zero
.loop_end18:

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
                                       
    jz .loop_end19

.loop_begin19:
    movaps (%rax), %xmm0        # load source into %xmm0
    movaps %xmm0, (%r10)        # store %xmm0


    addq $16, %rax             

    addq $16, %r10

    decq %rbx
    jnz .loop_begin19
.loop_end19:

    # load souce1 address into %rax
    
    # place address of parameter into %rax
    movq %rdx, %rax

    # load source2 address into %r10
    
    # place address of 2.0 into %r10
    movq $.const2.0, %r10

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
    jz .loop_end20                    # check whether number is equal to zero

.loop_begin20:
        movaps (%rax), %xmm0           # load first operand into %xmm0
        movaps (%r10), %xmm1           # load second operand into %xmm1

        # perform operation
        mulps %xmm1, %xmm0    

        movaps %xmm0, (%r11)           # store result

        # increment pointers
        
    addq $16, %rax

        

        addq $16, %r11                 

        decq %rbx                      # decrement counter
        jnz .loop_begin20             # jump to loop header if counter is not zero
.loop_end20:


    # Condition
	
    # <load source address into %rax> 
    
    # place address of 4th local variable into %rax
    movq %rdi, %rax
    imulq $4, %rax, %rax
    addq $16, %rax
    imulq $4, %rax, %rax
    subq %rbp, %rax
    negq %rax
    andq $-16, %rax


    xorps %xmm1, %xmm1
    movq %rdi, %rbx
    shrq $2, %rbx

    jz .loop_end22

.loop_begin22:

    addps (%rax), %xmm1 
    
    # exist when %rax is not pointing to constant
    addq $16, %rax

    decq %rbx
    jnz .loop_begin22

.loop_end22:
    xorps %xmm0, %xmm0
    addss %xmm1,%xmm0
    shufps $147,%xmm1,%xmm1
    addss %xmm1,%xmm0
    shufps $147,%xmm1,%xmm1
    addss %xmm1,%xmm0
    shufps $147,%xmm1,%xmm1
    addss %xmm1,%xmm0

    ucomiss .L7.0, %xmm0
    jb .falsebranch21
    jmp .truebranch21


    .align 4
.L7.0:
    .float 7.0



.truebranch21:


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

    jz .loop_end24

.loop_begin24:

    addps (%rax), %xmm1 
    
    # exist when %rax is not pointing to constant
    addq $16, %rax

    decq %rbx
    jnz .loop_begin24

.loop_end24:
    xorps %xmm0, %xmm0
    addss %xmm1,%xmm0
    shufps $147,%xmm1,%xmm1
    addss %xmm1,%xmm0
    shufps $147,%xmm1,%xmm1
    addss %xmm1,%xmm0
    shufps $147,%xmm1,%xmm1
    addss %xmm1,%xmm0

    ucomiss .L8.0, %xmm0
    jb .truebranch23
    jmp .falsebranch23


    .align 4
.L8.0:
    .float 8.0



.truebranch23:

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
                                       
    jz .loop_end25

.loop_begin25:
    movaps (%rax), %xmm0        # load source into %xmm0
    movaps %xmm0, (%r10)        # store %xmm0


    addq $16, %rax             

    addq $16, %r10

    decq %rbx
    jnz .loop_begin25
.loop_end25:


	jmp .endif23

.falsebranch23:

.endif23:

##### While begin #####
jmp .loopcond26

.loopbegin26:
# while body

    # load source address into %rax
    
    # place address of 10.0 into %rax
    movq $.const10.0, %rax


    # load destination address into %r10
    
    # place address of parameter into %r10
    movq %rcx, %r10


    movq %rdi, %rbx                    
    shrq $2, %rbx                      
                                       
    jz .loop_end28

.loop_begin28:
    movaps (%rax), %xmm0        # load source into %xmm0
    movaps %xmm0, (%r10)        # store %xmm0


    addq $16, %r10

    decq %rbx
    jnz .loop_begin28
.loop_end28:


# while condition
.loopcond26:

    # Condition
	
    # <load source address into %rax> 
    
    # place address of parameter into %rax
    movq %rcx, %rax


    xorps %xmm1, %xmm1
    movq %rdi, %rbx
    shrq $2, %rbx

    jz .loop_end27

.loop_begin27:

    addps (%rax), %xmm1 
    
    # exist when %rax is not pointing to constant
    addq $16, %rax

    decq %rbx
    jnz .loop_begin27

.loop_end27:
    xorps %xmm0, %xmm0
    addss %xmm1,%xmm0
    shufps $147,%xmm1,%xmm1
    addss %xmm1,%xmm0
    shufps $147,%xmm1,%xmm1
    addss %xmm1,%xmm0
    shufps $147,%xmm1,%xmm1
    addss %xmm1,%xmm0

    ucomiss .L5.0, %xmm0
    jb .loopbegin26
    jmp .loopexit26




.loopexit26:


	jmp .endif21

.falsebranch21:

.endif21:


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
.const3.0:
    .float 3.0 
    .float 3.0 
    .float 3.0 
    .float 3.0

.data 
.align 16 
.const7.0:
    .float 7.0 
    .float 7.0 
    .float 7.0 
    .float 7.0

.data 
.align 16 
.const10.0:
    .float 10.0 
    .float 10.0 
    .float 10.0 
    .float 10.0


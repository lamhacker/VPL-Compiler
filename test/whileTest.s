
.text
.global whileOne
.type whileOne, @function
.p2align 4,,15

whileOne:
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

    
##### While begin #####
jmp .loopcond0

.loopbegin0:
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
    jz .loop_end2                    # check whether number is equal to zero

.loop_begin2:
        movaps (%rax), %xmm0           # load first operand into %xmm0
        movaps (%r10), %xmm1           # load second operand into %xmm1

        # perform operation
        subps %xmm1, %xmm0    

        movaps %xmm0, (%r11)           # store result

        # increment pointers
        
    addq $16, %rax

        

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


# while condition
.loopcond0:

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

    ucomiss .L40.0, %xmm0
    jb .loopexit0
    jmp .loopbegin0


    .align 4
.L40.0:
    .float 40.0



.loopexit0:


    popq    %rbx
    leave
    ret

.text
.global whileTwo
.type whileTwo, @function
.p2align 4,,15

whileTwo:
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
jmp .loopcond5

.loopbegin5:
# while body

    # load souce1 address into %rax
    
    # place address of parameter into %rax
    movq %rsi, %rax

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
    jz .loop_end7                    # check whether number is equal to zero

.loop_begin7:
        movaps (%rax), %xmm0           # load first operand into %xmm0
        movaps (%r10), %xmm1           # load second operand into %xmm1

        # perform operation
        subps %xmm1, %xmm0    

        movaps %xmm0, (%r11)           # store result

        # increment pointers
        
    addq $16, %rax

        

        addq $16, %r11                 

        decq %rbx                      # decrement counter
        jnz .loop_begin7             # jump to loop header if counter is not zero
.loop_end7:

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
    movq %rsi, %r10


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
	
    # load souce1 address into %rax
    
    # place address of parameter into %rax
    movq %rsi, %rax

    # load source2 address into %r10
    
    # place address of 6.0 into %r10
    movq $.const6.0, %r10

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
        minps %xmm1, %xmm0    

        movaps %xmm0, (%r11)           # store result

        # increment pointers
        
    addq $16, %rax

        

        addq $16, %r11                 

        decq %rbx                      # decrement counter
        jnz .loop_begin4             # jump to loop header if counter is not zero
.loop_end4:

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

    ucomiss .L20.0, %xmm0
    jb .loopexit5
    jmp .loopbegin5


    .align 4
.L20.0:
    .float 20.0



.loopexit5:


    popq    %rbx
    leave
    ret

.text
.global whileThree
.type whileThree, @function
.p2align 4,,15

whileThree:
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
jmp .loopcond10

.loopbegin10:
# while body

    # load souce1 address into %rax
    
    # place address of parameter into %rax
    movq %rsi, %rax

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
    jz .loop_end12                    # check whether number is equal to zero

.loop_begin12:
        movaps (%rax), %xmm0           # load first operand into %xmm0
        movaps (%r10), %xmm1           # load second operand into %xmm1

        # perform operation
        subps %xmm1, %xmm0    

        movaps %xmm0, (%r11)           # store result

        # increment pointers
        
    addq $16, %rax

        

        addq $16, %r11                 

        decq %rbx                      # decrement counter
        jnz .loop_begin12             # jump to loop header if counter is not zero
.loop_end12:

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


# while condition
.loopcond10:

    # Condition
	
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
    jz .loop_end9                    # check whether number is equal to zero

.loop_begin9:
        movaps (%rax), %xmm0           # load first operand into %xmm0
        movaps (%r10), %xmm1           # load second operand into %xmm1

        # perform operation
        subps %xmm1, %xmm0    

        movaps %xmm0, (%r11)           # store result

        # increment pointers
        
    addq $16, %rax

        

        addq $16, %r11                 

        decq %rbx                      # decrement counter
        jnz .loop_begin9             # jump to loop header if counter is not zero
.loop_end9:

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

    ucomiss .L2.0, %xmm0
    jb .loopexit10
    jmp .loopbegin10


    .align 4
.L2.0:
    .float 2.0



.loopexit10:


    popq    %rbx
    leave
    ret

.text
.global whileFour
.type whileFour, @function
.p2align 4,,15

whileFour:
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
jmp .loopcond15

.loopbegin15:
# while body

    # load souce1 address into %rax
    
    # place address of parameter into %rax
    movq %rsi, %rax

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
    movq %rsi, %r10


    movq %rdi, %rbx                    
    shrq $2, %rbx                      
                                       
    jz .loop_end18

.loop_begin18:
    movaps (%rax), %xmm0        # load source into %xmm0
    movaps %xmm0, (%r10)        # store %xmm0


    addq $16, %rax             

    addq $16, %r10

    decq %rbx
    jnz .loop_begin18
.loop_end18:

##### While begin #####
jmp .loopcond19

.loopbegin19:
# while body

    # load souce1 address into %rax
    
    # place address of parameter into %rax
    movq %rdx, %rax

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
    jz .loop_end21                    # check whether number is equal to zero

.loop_begin21:
        movaps (%rax), %xmm0           # load first operand into %xmm0
        movaps (%r10), %xmm1           # load second operand into %xmm1

        # perform operation
        addps %xmm1, %xmm0    

        movaps %xmm0, (%r11)           # store result

        # increment pointers
        
    addq $16, %rax

        

        addq $16, %r11                 

        decq %rbx                      # decrement counter
        jnz .loop_begin21             # jump to loop header if counter is not zero
.loop_end21:

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
    movq %rdx, %r10


    movq %rdi, %rbx                    
    shrq $2, %rbx                      
                                       
    jz .loop_end22

.loop_begin22:
    movaps (%rax), %xmm0        # load source into %xmm0
    movaps %xmm0, (%r10)        # store %xmm0


    addq $16, %rax             

    addq $16, %r10

    decq %rbx
    jnz .loop_begin22
.loop_end22:


# while condition
.loopcond19:

    # Condition
	
    # <load source address into %rax> 
    
    # place address of parameter into %rax
    movq %rdx, %rax


    xorps %xmm1, %xmm1
    movq %rdi, %rbx
    shrq $2, %rbx

    jz .loop_end20

.loop_begin20:

    addps (%rax), %xmm1 
    
    # exist when %rax is not pointing to constant
    addq $16, %rax

    decq %rbx
    jnz .loop_begin20

.loop_end20:
    xorps %xmm0, %xmm0
    addss %xmm1,%xmm0
    shufps $147,%xmm1,%xmm1
    addss %xmm1,%xmm0
    shufps $147,%xmm1,%xmm1
    addss %xmm1,%xmm0
    shufps $147,%xmm1,%xmm1
    addss %xmm1,%xmm0

    ucomiss .L5.0, %xmm0
    jb .loopbegin19
    jmp .loopexit19


    .align 4
.L5.0:
    .float 5.0



.loopexit19:


# while condition
.loopcond15:

    # Condition
	
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
    jz .loop_end14                    # check whether number is equal to zero

.loop_begin14:
        movaps (%rax), %xmm0           # load first operand into %xmm0
        movaps (%r10), %xmm1           # load second operand into %xmm1

        # perform operation
        subps %xmm1, %xmm0    

        movaps %xmm0, (%r11)           # store result

        # increment pointers
        
    addq $16, %rax

        

        addq $16, %r11                 

        decq %rbx                      # decrement counter
        jnz .loop_begin14             # jump to loop header if counter is not zero
.loop_end14:

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

    jz .loop_end16

.loop_begin16:

    addps (%rax), %xmm1 
    
    # exist when %rax is not pointing to constant
    addq $16, %rax

    decq %rbx
    jnz .loop_begin16

.loop_end16:
    xorps %xmm0, %xmm0
    addss %xmm1,%xmm0
    shufps $147,%xmm1,%xmm1
    addss %xmm1,%xmm0
    shufps $147,%xmm1,%xmm1
    addss %xmm1,%xmm0
    shufps $147,%xmm1,%xmm1
    addss %xmm1,%xmm0

    ucomiss .L8.0, %xmm0
    jb .loopexit15
    jmp .loopbegin15


    .align 4
.L8.0:
    .float 8.0



.loopexit15:


    popq    %rbx
    leave
    ret

.text
.global whileFive
.type whileFive, @function
.p2align 4,,15

whileFive:
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
jmp .loopcond23

.loopbegin23:
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
    jz .loop_end25                    # check whether number is equal to zero

.loop_begin25:
        movaps (%rax), %xmm0           # load first operand into %xmm0
        movaps (%r10), %xmm1           # load second operand into %xmm1

        # perform operation
        subps %xmm1, %xmm0    

        movaps %xmm0, (%r11)           # store result

        # increment pointers
        
    addq $16, %rax

        

        addq $16, %r11                 

        decq %rbx                      # decrement counter
        jnz .loop_begin25             # jump to loop header if counter is not zero
.loop_end25:

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
                                       
    jz .loop_end26

.loop_begin26:
    movaps (%rax), %xmm0        # load source into %xmm0
    movaps %xmm0, (%r10)        # store %xmm0


    addq $16, %rax             

    addq $16, %r10

    decq %rbx
    jnz .loop_begin26
.loop_end26:


# while condition
.loopcond23:

    # Condition
	
    # <load source address into %rax> 
    
    # place address of parameter into %rax
    movq %rsi, %rax


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

    ucomiss .L2.0, %xmm0
    jb .loopexit23
    jmp .loopbegin23




.loopexit23:

##### While begin #####
jmp .loopcond27

.loopbegin27:
# while body

    # load souce1 address into %rax
    
    # place address of parameter into %rax
    movq %rsi, %rax

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
    jz .loop_end29                    # check whether number is equal to zero

.loop_begin29:
        movaps (%rax), %xmm0           # load first operand into %xmm0
        movaps (%r10), %xmm1           # load second operand into %xmm1

        # perform operation
        addps %xmm1, %xmm0    

        movaps %xmm0, (%r11)           # store result

        # increment pointers
        
    addq $16, %rax

        

        addq $16, %r11                 

        decq %rbx                      # decrement counter
        jnz .loop_begin29             # jump to loop header if counter is not zero
.loop_end29:

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
    movq %rsi, %r10


    movq %rdi, %rbx                    
    shrq $2, %rbx                      
                                       
    jz .loop_end30

.loop_begin30:
    movaps (%rax), %xmm0        # load source into %xmm0
    movaps %xmm0, (%r10)        # store %xmm0


    addq $16, %rax             

    addq $16, %r10

    decq %rbx
    jnz .loop_begin30
.loop_end30:


# while condition
.loopcond27:

    # Condition
	
    # <load source address into %rax> 
    
    # place address of parameter into %rax
    movq %rsi, %rax


    xorps %xmm1, %xmm1
    movq %rdi, %rbx
    shrq $2, %rbx

    jz .loop_end28

.loop_begin28:

    addps (%rax), %xmm1 
    
    # exist when %rax is not pointing to constant
    addq $16, %rax

    decq %rbx
    jnz .loop_begin28

.loop_end28:
    xorps %xmm0, %xmm0
    addss %xmm1,%xmm0
    shufps $147,%xmm1,%xmm1
    addss %xmm1,%xmm0
    shufps $147,%xmm1,%xmm1
    addss %xmm1,%xmm0
    shufps $147,%xmm1,%xmm1
    addss %xmm1,%xmm0

    ucomiss .L8.0, %xmm0
    jb .loopbegin27
    jmp .loopexit27




.loopexit27:


    popq    %rbx
    leave
    ret

.text
.global whileSix
.type whileSix, @function
.p2align 4,,15

whileSix:
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

    
##### While begin #####
jmp .loopcond31

.loopbegin31:
# while body

    # load souce1 address into %rax
    
    # place address of parameter into %rax
    movq %rsi, %rax

    # load source2 address into %r10
    
    # place address of 0.01 into %r10
    movq $.const0.01, %r10

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
    jz .loop_end33                    # check whether number is equal to zero

.loop_begin33:
        movaps (%rax), %xmm0           # load first operand into %xmm0
        movaps (%r10), %xmm1           # load second operand into %xmm1

        # perform operation
        addps %xmm1, %xmm0    

        movaps %xmm0, (%r11)           # store result

        # increment pointers
        
    addq $16, %rax

        

        addq $16, %r11                 

        decq %rbx                      # decrement counter
        jnz .loop_begin33             # jump to loop header if counter is not zero
.loop_end33:

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
                                       
    jz .loop_end34

.loop_begin34:
    movaps (%rax), %xmm0        # load source into %xmm0
    movaps %xmm0, (%r10)        # store %xmm0


    addq $16, %rax             

    addq $16, %r10

    decq %rbx
    jnz .loop_begin34
.loop_end34:


# while condition
.loopcond31:

    # Condition
	
    # <load source address into %rax> 
    
    # place address of parameter into %rax
    movq %rsi, %rax


    xorps %xmm1, %xmm1
    movq %rdi, %rbx
    shrq $2, %rbx

    jz .loop_end32

.loop_begin32:

    addps (%rax), %xmm1 
    
    # exist when %rax is not pointing to constant
    addq $16, %rax

    decq %rbx
    jnz .loop_begin32

.loop_end32:
    xorps %xmm0, %xmm0
    addss %xmm1,%xmm0
    shufps $147,%xmm1,%xmm1
    addss %xmm1,%xmm0
    shufps $147,%xmm1,%xmm1
    addss %xmm1,%xmm0
    shufps $147,%xmm1,%xmm1
    addss %xmm1,%xmm0

    ucomiss .L1000000.0, %xmm0
    jb .loopbegin31
    jmp .loopexit31


    .align 4
.L1000000.0:
    .float 1000000.0



.loopexit31:


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
.const6.0:
    .float 6.0 
    .float 6.0 
    .float 6.0 
    .float 6.0

.data 
.align 16 
.const0.01:
    .float 0.01 
    .float 0.01 
    .float 0.01 
    .float 0.01


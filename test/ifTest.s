
.text
.global ifOne
.type ifOne, @function
.p2align 4,,15

ifOne:
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

    ucomiss .L10.0, %xmm0
    jb .truebranch0
    jmp .falsebranch0


    .align 4
.L10.0:
    .float 10.0



.truebranch0:

    # load source address into %rax
    
    # place address of 4.0 into %rax
    movq $.const4.0, %rax


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


	jmp .endif0

.falsebranch0:

.endif0:


    popq    %rbx
    leave
    ret

.text
.global ifTwo
.type ifTwo, @function
.p2align 4,,15

ifTwo:
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

    

    # Condition
	
    # <load source address into %rax> 
    
    # place address of parameter into %rax
    movq %rsi, %rax


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

    ucomiss .L10.0, %xmm0
    jb .falsebranch3
    jmp .truebranch3




.truebranch3:

    # load source address into %rax
    
    # place address of 5.0 into %rax
    movq $.const5.0, %rax


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


	jmp .endif3

.falsebranch3:

.endif3:


    popq    %rbx
    leave
    ret

.text
.global ifThree
.type ifThree, @function
.p2align 4,,15

ifThree:
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

    

    # Condition
	
    # <load source address into %rax> 
    
    # place address of parameter into %rax
    movq %rsi, %rax


    xorps %xmm1, %xmm1
    movq %rdi, %rbx
    shrq $2, %rbx

    jz .loop_end7

.loop_begin7:

    addps (%rax), %xmm1 
    
    # exist when %rax is not pointing to constant
    addq $16, %rax

    decq %rbx
    jnz .loop_begin7

.loop_end7:
    xorps %xmm0, %xmm0
    addss %xmm1,%xmm0
    shufps $147,%xmm1,%xmm1
    addss %xmm1,%xmm0
    shufps $147,%xmm1,%xmm1
    addss %xmm1,%xmm0
    shufps $147,%xmm1,%xmm1
    addss %xmm1,%xmm0

    ucomiss .L10.0, %xmm0
    jb .falsebranch6
    jmp .truebranch6




.truebranch6:

    # load source address into %rax
    
    # place address of 4.0 into %rax
    movq $.const4.0, %rax


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

    ucomiss .L20.0, %xmm0
    jb .truebranch9
    jmp .falsebranch9


    .align 4
.L20.0:
    .float 20.0



.truebranch9:

    # load source address into %rax
    
    # place address of 3.0 into %rax
    movq $.const3.0, %rax


    # load destination address into %r10
    
    # place address of parameter into %r10
    movq %rsi, %r10


    movq %rdi, %rbx                    
    shrq $2, %rbx                      
                                       
    jz .loop_end11

.loop_begin11:
    movaps (%rax), %xmm0        # load source into %xmm0
    movaps %xmm0, (%r10)        # store %xmm0


    addq $16, %r10

    decq %rbx
    jnz .loop_begin11
.loop_end11:


	jmp .endif9

.falsebranch9:

.endif9:


	jmp .endif6

.falsebranch6:

.endif6:


    popq    %rbx
    leave
    ret

.text
.global ifFour
.type ifFour, @function
.p2align 4,,15

ifFour:
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

    ucomiss .L10.0, %xmm0
    jb .falsebranch12
    jmp .truebranch12




.truebranch12:

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
        minps %xmm1, %xmm0    

        movaps %xmm0, (%r11)           # store result

        # increment pointers
        
    addq $16, %rax

        

        addq $16, %r11                 

        decq %rbx                      # decrement counter
        jnz .loop_begin14             # jump to loop header if counter is not zero
.loop_end14:


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

    ucomiss .L20.0, %xmm0
    jb .truebranch15
    jmp .falsebranch15




.truebranch15:


    # Condition
	
    # <load source address into %rax> 
    
    # place address of parameter into %rax
    movq %rsi, %rax


    xorps %xmm1, %xmm1
    movq %rdi, %rbx
    shrq $2, %rbx

    jz .loop_end18

.loop_begin18:

    addps (%rax), %xmm1 
    
    # exist when %rax is not pointing to constant
    addq $16, %rax

    decq %rbx
    jnz .loop_begin18

.loop_end18:
    xorps %xmm0, %xmm0
    addss %xmm1,%xmm0
    shufps $147,%xmm1,%xmm1
    addss %xmm1,%xmm0
    shufps $147,%xmm1,%xmm1
    addss %xmm1,%xmm0
    shufps $147,%xmm1,%xmm1
    addss %xmm1,%xmm0

    ucomiss .L15.0, %xmm0
    jb .falsebranch17
    jmp .truebranch17


    .align 4
.L15.0:
    .float 15.0



.truebranch17:

    # load source address into %rax
    
    # place address of 3.0 into %rax
    movq $.const3.0, %rax


    # load destination address into %r10
    
    # place address of parameter into %r10
    movq %rsi, %r10


    movq %rdi, %rbx                    
    shrq $2, %rbx                      
                                       
    jz .loop_end19

.loop_begin19:
    movaps (%rax), %xmm0        # load source into %xmm0
    movaps %xmm0, (%r10)        # store %xmm0


    addq $16, %r10

    decq %rbx
    jnz .loop_begin19
.loop_end19:


	jmp .endif17

.falsebranch17:

.endif17:


	jmp .endif15

.falsebranch15:

.endif15:


	jmp .endif12

.falsebranch12:

.endif12:


    popq    %rbx
    leave
    ret

.text
.global ifFive
.type ifFive, @function
.p2align 4,,15

ifFive:
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

    jz .loop_end21

.loop_begin21:

    addps (%rax), %xmm1 
    
    # exist when %rax is not pointing to constant
    addq $16, %rax

    decq %rbx
    jnz .loop_begin21

.loop_end21:
    xorps %xmm0, %xmm0
    addss %xmm1,%xmm0
    shufps $147,%xmm1,%xmm1
    addss %xmm1,%xmm0
    shufps $147,%xmm1,%xmm1
    addss %xmm1,%xmm0
    shufps $147,%xmm1,%xmm1
    addss %xmm1,%xmm0

    ucomiss .L10.0, %xmm0
    jb .falsebranch20
    jmp .truebranch20




.truebranch20:

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
    jz .loop_end22                    # check whether number is equal to zero

.loop_begin22:
        movaps (%rax), %xmm0           # load first operand into %xmm0
        movaps (%r10), %xmm1           # load second operand into %xmm1

        # perform operation
        minps %xmm1, %xmm0    

        movaps %xmm0, (%r11)           # store result

        # increment pointers
        
    addq $16, %rax

        

        addq $16, %r11                 

        decq %rbx                      # decrement counter
        jnz .loop_begin22             # jump to loop header if counter is not zero
.loop_end22:


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

    ucomiss .L20.0, %xmm0
    jb .truebranch23
    jmp .falsebranch23




.truebranch23:


    # Condition
	
    # <load source address into %rax> 
    
    # place address of parameter into %rax
    movq %rsi, %rax


    xorps %xmm1, %xmm1
    movq %rdi, %rbx
    shrq $2, %rbx

    jz .loop_end26

.loop_begin26:

    addps (%rax), %xmm1 
    
    # exist when %rax is not pointing to constant
    addq $16, %rax

    decq %rbx
    jnz .loop_begin26

.loop_end26:
    xorps %xmm0, %xmm0
    addss %xmm1,%xmm0
    shufps $147,%xmm1,%xmm1
    addss %xmm1,%xmm0
    shufps $147,%xmm1,%xmm1
    addss %xmm1,%xmm0
    shufps $147,%xmm1,%xmm1
    addss %xmm1,%xmm0

    ucomiss .L15.0, %xmm0
    jb .falsebranch25
    jmp .truebranch25




.truebranch25:

    # load source address into %rax
    
    # place address of 3.0 into %rax
    movq $.const3.0, %rax


    # load destination address into %r10
    
    # place address of parameter into %r10
    movq %rsi, %r10


    movq %rdi, %rbx                    
    shrq $2, %rbx                      
                                       
    jz .loop_end27

.loop_begin27:
    movaps (%rax), %xmm0        # load source into %xmm0
    movaps %xmm0, (%r10)        # store %xmm0


    addq $16, %r10

    decq %rbx
    jnz .loop_begin27
.loop_end27:


	jmp .endif25

.falsebranch25:

.endif25:


	jmp .endif23

.falsebranch23:

.endif23:


	jmp .endif20

.falsebranch20:

.endif20:

    # load souce1 address into %rax
    
    # place address of parameter into %rax
    movq %rsi, %rax

    # load source2 address into %r10
    
    # place address of 5.0 into %r10
    movq $.const5.0, %r10

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
    jz .loop_end28                    # check whether number is equal to zero

.loop_begin28:
        movaps (%rax), %xmm0           # load first operand into %xmm0
        movaps (%r10), %xmm1           # load second operand into %xmm1

        # perform operation
        addps %xmm1, %xmm0    

        movaps %xmm0, (%r11)           # store result

        # increment pointers
        
    addq $16, %rax

        

        addq $16, %r11                 

        decq %rbx                      # decrement counter
        jnz .loop_begin28             # jump to loop header if counter is not zero
.loop_end28:


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

    jz .loop_end30

.loop_begin30:

    addps (%rax), %xmm1 
    
    # exist when %rax is not pointing to constant
    addq $16, %rax

    decq %rbx
    jnz .loop_begin30

.loop_end30:
    xorps %xmm0, %xmm0
    addss %xmm1,%xmm0
    shufps $147,%xmm1,%xmm1
    addss %xmm1,%xmm0
    shufps $147,%xmm1,%xmm1
    addss %xmm1,%xmm0
    shufps $147,%xmm1,%xmm1
    addss %xmm1,%xmm0

    ucomiss .L10.0, %xmm0
    jb .falsebranch29
    jmp .truebranch29




.truebranch29:

    # load source address into %rax
    
    # place address of 1.0 into %rax
    movq $.const1.0, %rax


    # load destination address into %r10
    
    # place address of parameter into %r10
    movq %rsi, %r10


    movq %rdi, %rbx                    
    shrq $2, %rbx                      
                                       
    jz .loop_end31

.loop_begin31:
    movaps (%rax), %xmm0        # load source into %xmm0
    movaps %xmm0, (%r10)        # store %xmm0


    addq $16, %r10

    decq %rbx
    jnz .loop_begin31
.loop_end31:


	jmp .endif29

.falsebranch29:

.endif29:


    popq    %rbx
    leave
    ret

.text
.global ifSix
.type ifSix, @function
.p2align 4,,15

ifSix:
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

    
    # load souce1 address into %rax
    
    # place address of parameter into %rax
    movq %rsi, %rax

    # load source2 address into %r10
    
    # place address of 2.0 into %r10
    movq $.const2.0, %r10

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
    jz .loop_end32                    # check whether number is equal to zero

.loop_begin32:
        movaps (%rax), %xmm0           # load first operand into %xmm0
        movaps (%r10), %xmm1           # load second operand into %xmm1

        # perform operation
        mulps %xmm1, %xmm0    

        movaps %xmm0, (%r11)           # store result

        # increment pointers
        
    addq $16, %rax

        

        addq $16, %r11                 

        decq %rbx                      # decrement counter
        jnz .loop_begin32             # jump to loop header if counter is not zero
.loop_end32:


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

    jz .loop_end34

.loop_begin34:

    addps (%rax), %xmm1 
    
    # exist when %rax is not pointing to constant
    addq $16, %rax

    decq %rbx
    jnz .loop_begin34

.loop_end34:
    xorps %xmm0, %xmm0
    addss %xmm1,%xmm0
    shufps $147,%xmm1,%xmm1
    addss %xmm1,%xmm0
    shufps $147,%xmm1,%xmm1
    addss %xmm1,%xmm0
    shufps $147,%xmm1,%xmm1
    addss %xmm1,%xmm0

    ucomiss .L10.0, %xmm0
    jb .falsebranch33
    jmp .truebranch33




.truebranch33:

    # load source address into %rax
    
    # place address of 5.0 into %rax
    movq $.const5.0, %rax


    # load destination address into %r10
    
    # place address of parameter into %r10
    movq %rsi, %r10


    movq %rdi, %rbx                    
    shrq $2, %rbx                      
                                       
    jz .loop_end35

.loop_begin35:
    movaps (%rax), %xmm0        # load source into %xmm0
    movaps %xmm0, (%r10)        # store %xmm0


    addq $16, %r10

    decq %rbx
    jnz .loop_begin35
.loop_end35:


	jmp .endif33

.falsebranch33:

.endif33:

    # load souce1 address into %rax
    
    # place address of parameter into %rax
    movq %rdx, %rax

    # load source2 address into %r10
    
    # place address of 10.0 into %r10
    movq $.const10.0, %r10

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
    jz .loop_end36                    # check whether number is equal to zero

.loop_begin36:
        movaps (%rax), %xmm0           # load first operand into %xmm0
        movaps (%r10), %xmm1           # load second operand into %xmm1

        # perform operation
        divps %xmm1, %xmm0    

        movaps %xmm0, (%r11)           # store result

        # increment pointers
        
    addq $16, %rax

        

        addq $16, %r11                 

        decq %rbx                      # decrement counter
        jnz .loop_begin36             # jump to loop header if counter is not zero
.loop_end36:


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

    jz .loop_end38

.loop_begin38:

    addps (%rax), %xmm1 
    
    # exist when %rax is not pointing to constant
    addq $16, %rax

    decq %rbx
    jnz .loop_begin38

.loop_end38:
    xorps %xmm0, %xmm0
    addss %xmm1,%xmm0
    shufps $147,%xmm1,%xmm1
    addss %xmm1,%xmm0
    shufps $147,%xmm1,%xmm1
    addss %xmm1,%xmm0
    shufps $147,%xmm1,%xmm1
    addss %xmm1,%xmm0

    ucomiss .L20.0, %xmm0
    jb .truebranch37
    jmp .falsebranch37




.truebranch37:

    # load source address into %rax
    
    # place address of 10.0 into %rax
    movq $.const10.0, %rax


    # load destination address into %r10
    
    # place address of parameter into %r10
    movq %rdx, %r10


    movq %rdi, %rbx                    
    shrq $2, %rbx                      
                                       
    jz .loop_end39

.loop_begin39:
    movaps (%rax), %xmm0        # load source into %xmm0
    movaps %xmm0, (%r10)        # store %xmm0


    addq $16, %r10

    decq %rbx
    jnz .loop_begin39
.loop_end39:


	jmp .endif37

.falsebranch37:

.endif37:


    popq    %rbx
    leave
    ret

.text
.global ifSeven
.type ifSeven, @function
.p2align 4,,15

ifSeven:
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
    jz .loop_end40                    # check whether number is equal to zero

.loop_begin40:
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
        jnz .loop_begin40             # jump to loop header if counter is not zero
.loop_end40:


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

    jz .loop_end42

.loop_begin42:

    addps (%rax), %xmm1 
    
    # exist when %rax is not pointing to constant
    addq $16, %rax

    decq %rbx
    jnz .loop_begin42

.loop_end42:
    xorps %xmm0, %xmm0
    addss %xmm1,%xmm0
    shufps $147,%xmm1,%xmm1
    addss %xmm1,%xmm0
    shufps $147,%xmm1,%xmm1
    addss %xmm1,%xmm0
    shufps $147,%xmm1,%xmm1
    addss %xmm1,%xmm0

    ucomiss .L100.0, %xmm0
    jb .truebranch41
    jmp .falsebranch41


    .align 4
.L100.0:
    .float 100.0



.truebranch41:

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
    jz .loop_end43                    # check whether number is equal to zero

.loop_begin43:
        movaps (%rax), %xmm0           # load first operand into %xmm0
        movaps (%r10), %xmm1           # load second operand into %xmm1

        # perform operation
        addps %xmm1, %xmm0    

        movaps %xmm0, (%r11)           # store result

        # increment pointers
        
    addq $16, %rax

        

        addq $16, %r11                 

        decq %rbx                      # decrement counter
        jnz .loop_begin43             # jump to loop header if counter is not zero
.loop_end43:

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
                                       
    jz .loop_end44

.loop_begin44:
    movaps (%rax), %xmm0        # load source into %xmm0
    movaps %xmm0, (%r10)        # store %xmm0


    addq $16, %rax             

    addq $16, %r10

    decq %rbx
    jnz .loop_begin44
.loop_end44:

    # load souce1 address into %rax
    
    # place address of parameter into %rax
    movq %rdx, %rax

    # load source2 address into %r10
    
    # place address of 5.0 into %r10
    movq $.const5.0, %r10

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
    jz .loop_end45                    # check whether number is equal to zero

.loop_begin45:
        movaps (%rax), %xmm0           # load first operand into %xmm0
        movaps (%r10), %xmm1           # load second operand into %xmm1

        # perform operation
        addps %xmm1, %xmm0    

        movaps %xmm0, (%r11)           # store result

        # increment pointers
        
    addq $16, %rax

        

        addq $16, %r11                 

        decq %rbx                      # decrement counter
        jnz .loop_begin45             # jump to loop header if counter is not zero
.loop_end45:

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
                                       
    jz .loop_end46

.loop_begin46:
    movaps (%rax), %xmm0        # load source into %xmm0
    movaps %xmm0, (%r10)        # store %xmm0


    addq $16, %rax             

    addq $16, %r10

    decq %rbx
    jnz .loop_begin46
.loop_end46:


	jmp .endif41

.falsebranch41:

.endif41:


    popq    %rbx
    leave
    ret

.text
.global ifEight
.type ifEight, @function
.p2align 4,,15

ifEight:
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

    

    # Condition
	
    # <load source address into %rax> 
    
    # place address of 1.0 into %rax
    movq $.const1.0, %rax


    xorps %xmm1, %xmm1
    movq %rdi, %rbx
    shrq $2, %rbx

    jz .loop_end48

.loop_begin48:

    addps (%rax), %xmm1 
    
    decq %rbx
    jnz .loop_begin48

.loop_end48:
    xorps %xmm0, %xmm0
    addss %xmm1,%xmm0
    shufps $147,%xmm1,%xmm1
    addss %xmm1,%xmm0
    shufps $147,%xmm1,%xmm1
    addss %xmm1,%xmm0
    shufps $147,%xmm1,%xmm1
    addss %xmm1,%xmm0

    ucomiss .L2.0, %xmm0
    jb .truebranch47
    jmp .falsebranch47


    .align 4
.L2.0:
    .float 2.0



.truebranch47:


	jmp .endif47

.falsebranch47:

.endif47:


    popq    %rbx
    leave
    ret

.data 
.align 16 
.const4.0:
    .float 4.0 
    .float 4.0 
    .float 4.0 
    .float 4.0

.data 
.align 16 
.const5.0:
    .float 5.0 
    .float 5.0 
    .float 5.0 
    .float 5.0

.data 
.align 16 
.const3.0:
    .float 3.0 
    .float 3.0 
    .float 3.0 
    .float 3.0

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
.const10.0:
    .float 10.0 
    .float 10.0 
    .float 10.0 
    .float 10.0


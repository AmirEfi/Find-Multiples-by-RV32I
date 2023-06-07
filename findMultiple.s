j main # jump to main

# Function to calculate % 3
reminderOf3:
	addi t3, zero, 3 # t3 = 3
loop3:
    blt a1, t3, endloop3 # check if (a1 > 3)
    	sub a1, a1, t3 # a1 -= t3 (3)
        j loop3
endloop3:
	add a0, zero, a1 # a0 = a1
    jr ra
#///////////////////////////////    
    
# Function to calculate % 5   
reminderOf5:
	addi t5, zero, 5 # t5 = 5
loop5:
    blt a1, t5, endloop5 # check if (a1 > 5)
    	sub a1, a1, t5 # a1 -= t5 (5)
        j loop5
endloop5:
	add a0, zero, a1 # a0 = a1
    jr ra
#////////////////////////////////

main:
	addi s1, zero, 0 # s1 = 0 , it holds the final result.
	addi s0, zero, 2 # s0 = 2 , i in the loop
	addi t0, zero, 20 # t0 = 20
	addi t4, zero, 0 # t4 = 0 , constant number for 0

loop:
	beq s0, t0, done # check if s0 != t0 (20)
    add a1, zero, s0 # a1 = s0 (the argument for the function)
    jal reminderOf3 # call reminderOf3 function
    add s3, a0, zero # s3 = a0  (s3 holds the return value of the function)
    
    	bne s3, t4, end1  # check if s3 == t4 (0)
        add s1, s1, s0   # s1 = s1 + s0 (sum of dividable numbers to 3)
        
    end1:
    	add a1, zero, s0 # a1 = s0 (the argument for the function)
    	jal reminderOf5 # call reminderOf5 function
        add s5, a0, zero # s5 = a0 (s5 holds the return value of the function)
        
    	bne s5, s3, endif # check if s5 == s3 , this if is to avoid multiple sum for a number that is dividable to both 3 and 5
        	j endelse
        
    	endif:
        	bne s5, t4, endelse # check if s5 == t4 (0)
    		add s1, s1, s0 # s1 = s1 + s0 (sum of dividable numbers to 5)
            
    endelse:
    addi s0, s0, 1 # s0 = s0 + 1 , just like i++
    j loop
done: 

# The final result is in s1.




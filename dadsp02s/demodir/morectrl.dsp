@pause(1)

moveto(w5) @CR
removewin(2) @CR

@pop("p1", -1, -1, 
" One of the advantages to using DADiSP/Controls is that 

 it is integrated with the DADiSP environment.") 
@pause(6)
@unpop("p1")
@pop("p1", -1, 5, 
" DADiSP/Controls introduces an iterative method for the 

 design of the most common types of control systems.") 
@pause(6)

@pop("p2", -1, 10, 
" This method allows the system to be designed through  

 specification of both the transfer function coefficients 

 and the performance characteristics of the system.") 
@pause(18)
@unpop("p2")
@unpop("p1")

calc(0) @CR   
! turn off the calculations first, because we'll output 
! new numerator and denominator coeffs in the process

cc @CR
D
@pop("p1", 34, 8, 
" The Design 2nd Order section provides the 

 user with an interactive method for the 

 simultaneous frequency and time domain design 

 of 2nd Order continuous systems.") 
@pause(18)
@unpop("p1")

@pop("p1", 34, 8, 
" The iterative aspects of the design are made
 
 possible through the use of a design menu that 

 echoes the dominant characteristics of the system 

 and allows them to be repeatedly changed.") 
@pause(18)
@unpop("p1")

@pop("p1", 34, 8, 
" At each step during the design, the effects of

 the most recent modification are included, and all 

 of the characteristics of the system are 

 recalculated.

 Accept the design after the entire system meets

 your specifications, and the coefficients are 

 placed in the specified windows.") 
@pause(20)
@unpop("p1")

@CR
@pause(2)
@pop("p1",1,0,
" The menu appears with a default transfer function and parameters. ")
@pause(6)
@unpop("p1")

@pop("p1",1,0," First, let's change the Damping Ratio. ")
@pause(6)
@unpop("p1")

@pop("p1",1,0,
" Then, the transfer function and characteristics will be recalculated. ")
@pause(6)
@unpop("p1")

@CR    ! this gets us into the damping ratio submenu
@pause(2)
0.400 @pause(3) 
@CR
DMF("ddsgn2or.men") @CR
@pop("p1",1,0," Notice how the system characteristics have changed. ")
@pause(10)
@unpop("p1")

@pop("p1",1,0," Now, we change the Natural Frequency. ")
@pause(6)
@unpop("p1")

@DN @CR    ! this gets us into the natural frequency submenu
@pause(2)
15 @pause(3) 
@CR
DMF("ddsgn2or.men") @CR
@pop("p1",1,0," Once again, the system characteristics have changed. ")
@pause(10)
@unpop("p1")

@pop("p1",1,0,
" Now that we are satisfied with the design, ouput the transfer function. ")
@pause(10)
@unpop("p1")

! need 19 DN arrows to get to the ouput closed loop design params.
@DN @DN @DN @DN @DN
@DN @DN @DN @DN @DN
@DN @DN @DN @DN @DN
@DN @DN @DN @DN
@pause(5)
@pop("p1",1,0," Output the Numerator to W1 and the Denominator to W2. ")
@pause(6)
@unpop("p1")

@CR
@pop("p1",-1,-1,
" Now turn the calculations on, and watch the Worksheet recalculate. ")
@pause(6)
@unpop("p1")
REDRAWALL @CR
CALC(1) @pause(3)
@CR
@pop("p1",-1,-1,
" Integrated with the DADiSP Worksheet (TM), 

 DADiSP/Controls is a powerful tool for the design, 

 analysis, and simulation of LTI SISO controllers.")
@pause(8)
@unpop("p1")
@pause(4)
dmf("DemModul.men") @CR

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!									!
! DFM.DSP	Copyright (C) 1985,86 DSP Development Corporation    	!
!			All Rights Reverved                             !
!                   							!
!									!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

@pop("pop1",-1,-1,
"Welcome to a brief demo of DFM work session jan91 ")
@unpop("pop1")
@pause(5)
@CR @pause(3)
ascotel
@highlight_message("As you can see, you are presented with a new menu of commands.")
@pause(5)
@highlight_message("Let's review the commands available at this level.")
@pause(5)
@rt @pause(5) @rt @pause(5) @rt @pause(5) @rt @pause(5) @rt @pause(5) 
@rt @pause(5)
@highlight_message("Lets try to enter the Worksheet...") @pause(2.5)
@rt @pause(1) @rt @pause(1) @rt @pause(1) @rt @pause(1)
@cr
@pause (2)
@highlight_message("DADiSP tells us we must first ADD Windows to the Worksheet.")
@pause (3)
@highlight_message("We can do this by executing the ADD command...")  @pause(5)
@lf @pause(5) @lf @pause(5)
A
@highlight_message("Let's ADD 4 Windows") @pause(3)
4 @CR @pause(5)
@highlight_message("We can now ENTER the Worksheet by pressing E")
@pause(5) E
@pause(5)
@highlight_message("If we need help now that we're in the Worksheet use F1.") @pause(5)
@f1 @highlight_message("Most of these capabilities will be demonstrated shortly.")
@pause(5) @f1
@highlight_message("Now lets load a Signal into this Window. We press F8.") @pause(5)
@f8 @pause(3)
@highlight_message("We'll select the first Dataset in the list above.") @pause(5) @cr
@highlight_message("Let's take the first Signal in this Dataset.") @pause(2.5) @cr
@pause(5)
@highlight_message("If we want to know more about this Signal we can press F2.")
@pause(5)
@f2
@pause(8)
@f2
@highlight_message("We can enter this Window to enable additional features.") @pause(5)
@highlight_message("This is done by pressing the RETURN key.") @pause(5)
@cr
@highlight_message("Notice that the Window is now highlighted or active.") @pause(5)
@highlight_message("The F-keys and the arrow keys now have new capabilities.") @pause(5)
@highlight_message("We can see them by pressing F1 for HELP.") @pause(5)
@F1 @highlight_message("We will now demonstrate the use of the control keys above.")
@pause(8)
@f1
@highlight_message("Let's try zooming this Window for a better look - Use F10.") @pause(5)
@f10
@highlight_message("We can put different types of grids on this Window with F6.")
@pause(5)
@f6 @highlight_message("A dotted grid...") @pause(5) @f6 @highlight_message("or, a solid grid.")
@pause(5) @highlight_message("For now lets remove the grid by pressing F6 again.")
@pause(5) @f6
@highlight_message("If we wanted to see just the points of our Signal we hit F7.") @pause(5)
@f7
@pause(5) @highlight_message("We get the Signal back again with F7 also.") @pause(5) @f7
@pause(5)
@highlight_message("The scales can be removed and replaced with F5.") @pause(5)
@f5 @pause(5) @f5
@highlight_message("We can put a cursor on the Signal by pressing F9.") @pause(5) @f9
@highlight_message("The cursor will scroll with use of the arrow keys.") @pause(5)
@cntl_rt @cntl_rt @rt @rt @rt @rt @rt @rt @rt @rt @rt @rt @rt @rt @rt @rt @rt @rt @rt
@cntl_lf @cntl_lf @cntl_lf @lf @lf @lf @lf @lf @lf @lf @lf @lf @lf @lf @lf @lf @lf @lf @lf
@highlight_message("Note that DADiSP gives you the X and Y coordinates...") @pause(5)
@highlight_message("as well as the point number in parentheses at left...") @pause(5)
@highlight_message("and the engineering units of the Signal, eg. VOLTS.") @pause(5)
! @highlight_message("More about engineering units later.") 
@pause(5)
@highlight_message("Let's remove the cursor for now - we press F9.") @pause(5) @f9
@pause(5)
@highlight_message("With the cursor off, we can manipulate our graph further.") @pause(5)
@highlight_message("The arrow keys can be used to scroll the Signal...") @pause(5)
@highlight_message("in all directions.") @pause(5) @rt @rt
@pause(1) @lf @pause(1) @up @up @pause(1) @dn @dn @pause(1) @lf
@highlight_message("We can also expand and shrink the Signal in two directions.")
@pause(5)
@highlight_message("We use CTRL ->, CTRL <-, CTRL PGUP, and CTRL PGDN.") @pause(5)
@cntl_rt @cntl_rt @pause(5) @cntl_lf @cntl_lf @cntl_lf @pause(5)
@cntl_Pg_up @pause(1) @cntl_pg_dn @cntl_pg_dn @pause(5)
@highlight_message("We can restore the Signal to it's original form...") @pause(5)
@highlight_message("by pressing CTRL HOME.") @pause(5)
@cntl_home @pause(5)
@highlight_message("Why don't we leave this Window for now and do something else ?")
@pause(5)
@highlight_message("We first un-zoom by pressing F10 or RETURN.") @pause(5)
@f10
@highlight_message("We can de-activate the Window by pressing the ESC key.")
@pause(5)
@ESC
@highlight_message("Let's demonstrate some of the other capabilities of DADiSP.")
@pause(5)
@highlight_message("To move over to a fresh Window - we use the arrow keys.")
@pause(5)
@rt
@highlight_message("Let's say we want to smooth out the data in Window 1.")
@pause(5)
@highlight_message("This is very easy to do with DADiSP - we type a formula.")
@pause(5)
MOVAVG(W1,10) @cr
@pause(5)
@highlight_message("What we have done is a 10-point moving average...")
@pause(5)
@highlight_message("We have done it simply by typing the appropriate formula.")
@pause(5)
@highlight_message("To compare the smoothed Signal with the original ...") @pause(5)
@highlight_message("we can ZOOM Window 2 ...") @pause(5)
@cr @f10
@highlight_message("and OVERPLOT Window 1 by pressing F4 ...") @pause(5)
@f4 @pause(3) 1 @pause(3) @cr
@highlight_message("The ripples in the original Signal have been smoothed over") @pause(5)
@highlight_message("Let's do another example...")
@pause(5)
@ESC
@highlight_message("How about if we multiply Window 2 (W2) by itself ?")
@pause(5)
@highlight_message("We move to another empty Window and type the formula ...") @pause(5)
@RT @highlight_message("How about this Window ?") @pause(5)
W2*W2 @pause(5) @cr
@pause(5) @highlight_message("We have squared all the values in Window 2 ...") @pause(5)
@highlight_message("and produced a new Signal with this formula in Window 3.") @pause(5)
@highlight_message("We can take the derivative of a Window by typing the formula ...")
@pause(5)
@rt DERIV(W3) @pause(3) @CR
@pause(5)
@highlight_message("DADiSP performs symbolic engineering unit processing") @pause(5)
@cntl_home @pause(3)
@f2
@highlight_message("Notice that the engineering units of W1 are Volts") @pause(8)
@f2
@rt @pause(3) @f2
@highlight_message("Of course, the moving average retains the same units") @pause(8)
@f2
@rt @pause(3) @f2
@highlight_message("But the squared Signal evaluates to Volts squared!") @pause(8)
@f2
@rt @pause(3) @f2
@highlight_message("Even the derivative has the correct units!") @pause(8)
@f2
@highlight_message("DADiSP has over 150 individual functions for transforming data.")
@pause(5)
@highlight_message("Now we will quickly illustrate some more...") @pause(5)
@highlight_message("But first, lets ADD a few more Windows ...") @pause(5)
@highlight_message("We press the ESC key to exit the Worksheet ...")
@pause(3)
@ESC @pause(3)
@highlight_message("and A to ADD Windows") @pause(5)
A @pause(3) 5 
@pause(3) @CR
@highlight_message("You can use up to 64 Windows with DADiSP") @pause(3)
@highlight_message("Let's re-enter the Worksheet ...") @pause(5)
E
@pause(3)
@rt
@highlight_message("To calculate an FFT on the first 64 points of W4 ...") @pause(5)
@highlight_message("we type ...") @pause(3)
FFT(EXTRACT(W4,1,64)) @pause(5)
@highlight_message("and just press RETURN to execute") @pause(5) @CR
@highlight_message("A LOG-MAGNITUDE plot is just as easy") @pause(5)
@RT
LOG10(MAGNITUDE(W5)) @CR
@pause(5)
@RT 
@highlight_message("We can also generate Signals, like a sine wave") @pause(5)
GSIN(64,.1,1.0) @CR
@highlight_message("We created a 1 Hz sine wave of 64 points spaced .1 radians apart")
@pause(5)
@highlight_message("The DADiSP Worksheet has an extremely powerful feature ...") @pause(5)
@highlight_message("When a new Signal is loaded into a Window ...") @pause(5)
@highlight_message("All of the dependent Windows are updated!") @pause(5)
@cntl_home
@f8 @pause(3) @CR @rt @pause(3)
@highlight_message("For example, if we load a new Signal into W1 ...") @pause(5)
@highlight_message("all of the Windows that depend on W1 are re-evaluated") @pause(5)
@cr
@highlight_message("Analysis chains of amazing complexity can be built this way.")
@pause(5)
@highlight_message("DADiSP can then LOAD and SAVE these Worksheets") @pause(5)
@highlight_message("First, we press the ESC key to leave the Worksheet") @pause(5)
@ESC @pause(3)
@highlight_message("Then L to LOAD a previously saved Worksheet") @pause(3)
L Y
@pause(5)

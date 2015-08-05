removewin(-1) @cr
addwin(4) @cr 
@CNTL_HOME
echo("The DADiSP Worksheet") @cr @pause(2)
@pop("pop1",-1,4,
"                          REMEMBER:

  You can pause, speed-up or stop this demo at any time

      To speed up the demo, press the SPACE BAR.

      To interrupt the demo, click the STOP button.  
")
@pause(12) @unpop("pop1")
@pop("pop1",-1,8,
"
  We can put the Worksheet to work by bringing in some data.  
")
@pause(4)
@pop("pop2",-1,14,
"
  Let's load some data into DADiSP.  
")
@pause(6)
@unpop("pop2")
@unpop("pop1")                                                       


! CHANGE WITH NEW 4.0 WHEN MENUS WORK
@F8
TENSILE.1
@pause(3)
@CR
STRAIN_RATE 
@pause(3)
@CR @pause(2)



@pop("mes", -1, -1, 
"  
  We can learn more about this Series.  
")
@pause(4) @unpop("mes") @f2 @pause(6) @f2 
@pop("mes",-1,-1, 
" 
  Or display Descriptive Statistics using DADiSP popup menus.  
")


! CAN'T DO WITHOUT MENUS OR THE MENUFILE("STATSUM.MEN")
! @pause(4) @unpop("mes") \ @pause(4) S @pause(3) S  @pause(5)
! @ESC @ESC @ESC




@pop("pop1",-1,-1,
"  
  With DADiSP, each graphic window is fully DYNAMIC, enabling us to  

  set various window options, such as colors, grids, etc., as well 

  as letting us zoom, scroll, and cursor our data point-by-point,
")

@pause(10)
@unpop("pop1")
@pause(4) 
setxoffset(0) @CR
redraw @cr
@f10
@pause(2)
@pop("pop1",-1,-1,
" 
  Add Horizontal and Vertical Units,  
")
@pause(3)  @unpop("pop1") @f5 
@pause(4)
@pop("pop1",-1,-1,
" 
  Try different kinds of grids,  
")
@pause(3) @unpop("pop1")
@f6 @pause(2) gridsol;setxlog(1) @cr @pause(3) griddot @cr @pause(2) setxlog(0) @cr @pause(3) 
@pop("pop1",-1,-1,
" 
  Use the mouse to evaluate individual data points,  
")
@pause(3) @unpop("pop1")
@f9 @cntl_rt @cntl_rt @cntl_rt @pause(2)
@f9 @cntl_lf @cntl_lf @cntl_lf @pause(3)
@f9 @cntl_lf @cntl_lf @pause(3)
@ESC 
@pop("pop1",-1,-1,
" 
  Stretch or compress the data,  
")
@pause(3) @unpop("pop1")
@cntl_lf @cntl_lf @pause(2) 
@cntl_rt  
@cntl_rt @pause(2)  
@cntl_rt @cntl_rt @pause(3) 
@pop("pop1",-1,-1,
"
  Or change the colors of any of the graph elements.  
")
@pause(3) @unpop("pop1")
wincolor(black,yellow) ; gridcolor(green) ; griddot @CR @pause(3)

@pop("pop1",-1,-1,
"
  We can add free form text and lines to our graph.  
")

@pause(3) @unpop("pop1")
textcur(1,white,red,0,1,1) @cr @cntl_pg_up @cntl_pg_up @pause(1) 
@cntl_lf @cntl_lf @pause(1)
@sp Max: @sp {strnum(max)} @sp @pause(2) @cr @esc @pause(4)
@pop("pop1",-1,-1,
"  
  We can re-scale the graph.  
")

@pause(3) @unpop("pop1") @CNTL_HOME @pause(3)

@pop("mes", -1, -1, 
" 
  Let's leave this Window.  
")
@pause(3) @unpop("mes") @esc

@pop("pop1",-1,-1,
"
  The DADiSP Worksheet provides hundreds of functions  

  for data manipulation and analysis, including functions for:  

                Data Reduction

                Mathematical Transformations

                Signal Processing and Filtering

                Statistics and Matrix Manipulation

                and much more.
")                                                                    
@pause(6) @unpop("pop1")
@pop("pop1",-1,-1,
"
  You can design sophisticated data reduction algorithms

  by combining these fundamental functions in a DADiSP Worksheet.  

  DADiSP eliminates the need to learn a programming language.
")
@pause(6) @unpop("pop1")

@rt @pause(2)
@pop("mes", -1, -1, 
" 
  For example, say we want to smooth out the data in Window 1.  
")
@pause(5) @unpop("mes")
@pop("mes", -1, -1, 
" 
  Let's use a menu.  
")
@pause(4)
@Unpop("mes") 
WINCOLOR(BLACK,GREEN) @cr


! CAN"T USE THE MENU
! / @pause(2) M @pause(2) G @pause(2) M  @pause(2) @dn @pause(2) 
! @cr 15 @cr @pause(2) @end
moveto(w2) @cr
movavg(w1,15) @cr @pause(4)


@pop("mes", -1, 10, 
"
  We have produced a 15-point moving average.  
")
@pause(4)
@unpop("mes")
@pop("mes", -1, 10, 
" 
  Now we compare the smoothed Series with the original.  
")
@pause(4) 
@unpop("mes")
overlay(W1,red) @cr @pause(3)
@f10 
@pause(4) @pop("mes", -1,-1, 
" 
  Let's try another example ...  
") 
@pause(2) @unpop("mes") @ESC
@pop("mes", -1, 10, 
" 
  To extract a portion of the data in Window 1 ...  
")
@pause(4) @pop("mes2", -1, 14, 
" 
  ... we move to an empty Window and type the formula ...  
") 
@pause(3) @RT 
@pause(1) Extract(w1, 200, 100)
@pause(3) @unpop("mes2") @unpop("mes") @cr @pause(2)
@rt wincolor(black,red) @cr @pop("mes",-1, -1, 
" 
  We can specify any arithmetic expression.  
") 
@pause(4) W2*W2
@pause(3) @unpop("mes") @CR @pause(5) 
@pop("mes", -1, -1, 
" 
  Or, let's display the Histogram of W3 instead.  
") 
@pause(3) @unpop("mes")

Histogram(w3,20) @pause(3) @CR @pause(3) 
@pop("mes", -1, -1, 
"
  The DADiSP Worksheet has an extremely powerful feature...  
")
@pause(5) @unpop("mes")
@pop("mes", -1, -1, 
"
  When a new Series is loaded into a Window...  
") 
@pause(4) @unpop("mes")
@pop("mes", -1, -1, 
"
  ...  all of the dependent Windows are updated!  
") 
@pause(5) @unpop("mes") @cntl_home



! CHANGE WHEN NEW MENUS WORK WITH 4.0
loadseries("RUN1.1.ANALOG1") @pause(3) @CR  @pause(3)



@pop("pop1",-1,-1, 
" 
  Using the power and flexibility of this unique spreadsheet principle,  

  you can quickly create analysis chains of surprising complexity. 
")
@pause(7) @unpop("pop1")



@CNTL_HOME @RT 


! USE MENUS TO REMOVE WINDOWS
! @ESC R 3 @CR E
removewin(3) @cr @pause(2)


demo @CR
@DN @DN @DN 
@SUSPEND("@CR @ESC")
@RETURN

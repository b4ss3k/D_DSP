@pause(2)

! MoreHYST.DSP
! @ESC
@pop("p1",-1,-1,
"
   Let's take a closer look at the Stress-Strain curve.   
")
@pause(5)
@unpop("p1")
@CR zoom @CR

@pop("p1",5,3,
"
   Another interesting characteristic of the Stress-Strain curve   

   is the value for the average Strain at 0 Stress.
")
@pause(10)
@unpop("p1")
POFF @CR
overpl(xy(gser(-0.2,0),gser(0,0)),lcyan);overpl(xy(gser(-0.2,-0.2),gser(-8,8)),lcyan) @CR
overpl(xy(gser(0,0),gser(-8,8)),lcyan) @CR
PON @CR
@pop("p1",-1,1,
"
   In order to determine the average Strain at 0 Stress, we   

   must calculate from the data the interpolated values for 

   Strain at 0 Stress.  
")
@pause(10)
@unpop("p1")
@ESC
@pop("p1",-1,-1,
"
  To calculate the interpolated Strain at 0 Stress, find the 

  points at either side of zero crossings, fit a line between 

  them (y=mx+b), calculate the slope (m) and y intercept (b), 

  and finally interpolate a value for Strain at 0 Stress.  
")
@pause(14)
@unpop("p1")
@pop("p1",5,5,
"
 First, find the points on either side of where the Stress crossed zero. 
")
@pause(8)
@unpop("p1")
moveto(w4) @CR
addwin(5) @CR
moveto(w5) @CR

levelcross(w2,0);sticks @CR
@pop("p1",5,5,
"
   The LEVELCROSS function returns a binary series with a value   

   of 1 at the point before the Stress crossed zero, and 0 elsewhere.
")
@pause(10)
@unpop("p1")
moveto(w2) @CR
@CR zoom @cr
overlay(w5,lred,3) @CR
@pause(8)
unoverplot @CR
@ESC
moveto(w5) @CR
@pop("p1",5,5,
" 
 Now, multiply this by the data to get the actual Stress and Strain values. 
")
@pause(8)
@unpop("p1")
levelcross(w2,0) * W1 @CR
addwf('sticks;Label("Strain at Stress zero-crossings")') @CR
moveto(w6) @CR
levelcross(w2,0) * w2 @CR
addwf('sticks;Label("Stress at Stress zero crossings")') @CR
@pop("p1",5,5,
"
   To find the interpolated value for each zero crossing,   

   determine the slope and y-intercept of the line which

   connects the points on either side of the zero crossing.   
")
@pause(12)
@unpop("p1")
moveto(w7) @CR
setconf("status_processing","0") @CR
(w6-(levelcross(w2,0)*delay(w2,1)))/(w5-(levelcross(w2,0)*delay(w1,1)));label("DY/DX at crossings"); @CR
setconf("status_processing","1") @CR

@cr zoom @cr
@pop("p1",-1,1,
"
   This series contains the slope of the line at the crossing points.   
")
@pause(8)
@unpop("p1")
@ESC
moveto(w8) @CR
W6-(delay(W1,1)*levelcross(W2,0))*W7;label("y-intercept at crossings") @CR
@cr zoom @cr
@pop("p1",-1,1,
"
   This series contains the y-intercept of the line at the crossing points.   
")
@pause(8)
@unpop("p1")
@ESC
moveto(w9) @CR
@pop("p1",5,5,
"
   Given the slope and y-intercept, find the x-value (Strain)   

                   where y is zero (Stress = 0).

           Strain at 0 Stress = -(y intercept)/ slope     
")
@pause(10)
@unpop("p1")
setconf("status_processing","0") @CR
beep(0);(-w8/w7);delete(curr,curr==0);tablev;beep(1);label("Interpolated Strain") @CR
setconf("status_processing","1") @CR

@cr zoom @cr
@pop("p1",-1,1,
"
   This series contains the interpolated values of Strain at 0 Stress.   
")
@pause(8)
@unpop("p1")
#define _st1 "Strain" @CR
#define _st2 "Stress" @CR
@pop("p1",-1,1,
"
   So, the average value of Strain at 0 Stress is   

    the mean of the absolute value of Window 9.  
")
@pause(8)
@unpop("p1")
@ESC
clear(w3) @CR
display(w3) @CR
xy(w1,w2);scales(2) @CR

!Textcur(-1,-1,-1,1) @CR
!{strcat("Avg. ",_st1," at 0 ",_st2,": ",strnum(mean(abs(w9))))} @CR
!@ESC

text(0, 0, PAPER, LRED, -1, SMALL, strcat("Avg. ",_st1," at 0 ",_st2,": ",strnum(mean(abs(w9))))) @CR

@pause(5)
@pop("p1",-1,3,
"
   Now...how can we calculate the average Stress at 0 Strain?   
")
@pause(8)
@unpop("p1")
POFF @CR
overpl(xy(gser(0,0),gser(0,45)),lred);overpl(xy(gser(-0.02,0.02),gser(0,0)),lred) @CR
overpl(xy(gser(-0.02,0.02),gser(45,45)),lred) @CR
PON @CR
@pause(8)

unoverplot @CR
@pop("p1",5,5,
"
Let DADiSP's Spreadsheet Paradigm do the work!
")
@pause(6)
@unpop("p1")
display(w1,w2,w3) @CR
collayout(2,1) @CR
@pop("p1",-1,1,
"
  Our Worksheet calculates the center width of the hysteresis loop.  
")
@pause(8)
@pop("p2",-1,4,
"
  The new measurement we want is the center height of the loop.  
")
@pause(8)
@pop("p3",-1,8,
"
  Rather than create a new worksheet, we'll just 'swap' the order 

  of the Stress and Strain curves in Windows 1 and 2, and let the

  worksheet calculate the center width for the new hysteresis loop.

  This will effectively calculate the average Stress at 0 Strain. 
")
@pause(18)
@unpop("p3") @unpop("p2") @unpop("p1")

@pop("p1",10,10,
"
 First, we turn off calculations... 
")
@pause(3)
CALC(0) @CR
@unpop("p1")
@pop("p2",10,10,
"
 Then, simply swap the order of the Stress and Strain... 
")
@pause(6)
@unpop("p2")
#define _st1 "Stress" @CR
#define _st2 "Strain" @CR
loadseries(w1,"Tensile.1.Stress",1) @CR
loadseries(w2,"Tensile.1.Strain",1) @CR
@pop("p1",10,10,
"
 Now, turn calculations back on and let DADiSP recalculate the Worksheet. 
")
@pause(5)
setconf("status_processing","0") @CR
CALC(1) @CR
@unpop("p1")
moveto(w3) @CR
setconf("status_processing","1") @CR
@cr zoom @CR
@pause(6)
@pop("p1",-1,1,
"
   The new interpolated value is annotated automatically in the graph.   
")
@pause(5)
@unpop("p1")
@ESC
dmf("AppTopic.men") @CR

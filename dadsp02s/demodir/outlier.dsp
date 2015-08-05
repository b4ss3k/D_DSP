@pause(2)

removewin(-1) @cr
addwin(4) @cr 
@CNTL_HOME
@pop("pop1",-1,4,
"                      REMEMBER:

  You can pause, speed-up or stop this demo at any time

      To speed up the demo, press the SPACE BAR.

      To interrupt the demo, click the STOP button.  
")
@pause(6) @unpop("pop1")
@pop("pop1",-1,-1,
"
  Occasionally, during the acquisition of raw data, 

  unexpected data points will appear which may skew

  any analysis to be performed on valid data.
")
@pause(8)
@unpop("pop1")

@pop("pop1",-1,-1,
"
  DADiSP can help you to remove these unwanted data

  points and continue with your analysis, without fear  

  of tainted results due to unexpected data values.  
")
@pause(8)
@unpop("pop1")

@pop("pop1",-1,4,
"
  Data points lying outside of expected values  

  are typically referred to as 'OUTLIERS'.
")
@pause(6)

@pop("pop2",-1,8,
"
  Outliers can easily be replaced with data values that you can define.  
")
@pause(6)

@pop("pop3",-1,11,
" 
  Analysis can continue after suitable replacement values are in place.  
")
@pause(6)

@pop("pop4",-1,14,
" 
  Let's load some typical data and see how to go about this...  
")
@pause(6)


@unpop("pop4")  @unpop("pop3")  @unpop("pop2")  @unpop("pop1")

loadseries("outlier.1.DEMO")
@CNTL_HOME
@CR @F10  setsymbol(triangle) @CR
@pop("pop1",5,1,
"
  As you can see, this series contains many points    

  which lie well outside the main body of data.    

  Here, the unwanted points lie above the 'good' data.  
")

@pause(10) @unpop("pop1")
setsymbol(0) @CR
@F10 @ESC

@pop("pop1",-1,2,
"
  In order to remove these unwanted points,   

  we must first identify them.   
")
@pause(6)
@pop("pop2",-1,6,
"
  You can easily do this in DADiSP by using logical   

  and arithmetic operators and binary series to represent  

  TRUE (1) and FALSE (0) resultant conditions.
")

@pause(10)

@pop("pop3",-1,12,
"
  A binary series contains values of zero (0) and one (1),

  and is a very powerful tool in DADiSP.
")
@pause(8)

@unpop("pop3")  @unpop("pop2")  @unpop("pop1")

@pop("pop1",-1,1,
"
  A binary series shows where data meets a specifed condition.

  The binary series can then be used as a reference for the 

  replacement of data points in the original series.
")
@pause(10)  @unpop("pop1")


@pop("pop1",-1,1,
"
  Watch as we put a binary series to work for us...  
")
@pause(6)  @unpop("pop1")
@CNTL_HOME @RT W1>0.2 ; steps @CR @PAUSE(3)
@RT  OUTLIER(W1,W2);setwlike(w1,1) @CR @CNTL_HOME @pause(4)
@pop("pop1",15,14,
"
  We generated a binary series in Window 2 which returned  

  a one everywhere W1 > 0.2 and a zero everywhere W1 <= 0.2.  

  The unwanted points that appear in our original data series  
  
  in Window 1 are represented in Window 2 by the value 1.
")
@pause(12) @unpop("pop1")
@RT @CR @F10 @pause(3) @F10 @ESC
@pop("pop1",0,1,
"
  The unwanted points were then replaced with a linear  

  (straight line) interpolation between the previous and next  

  non-outlier values in the data series.

  The final result is shown in Window 3.
")
@pause(10) @unpop("pop1")
@RT @CR @F10 @pause(3) @F10 @ESC
@pop("pop1",-1,-1,
"
  We can compare the results of our outlier removal to the  

  original data to see if we have successfully stripped out  
 
  the unwanted values by overplotting the resultant series  

  onto the original in different line colors.
")
@pause(8) @unpop("pop1")
@CNTL_HOME
overplot(w3,lred) @CR @CR @F10

@pop("pop1",-1,0,
"
  The original data containing the unwanted points is 

  shown in blue with the resultant series overplotted in red.  
")

@pop("pop2",-1,18,
"
  All of the unwanted outlier points have been 

  removed from the resultant red series, leaving

  a series with only valid data points (red).
")
@pause(16)  @unpop("pop2")  @unpop("pop1")

@pause(5)
@F10 @ESC @CNTL_HOME @RT @RT @RT
defmacro("MoreInfoDSPFile","MoreOUT.dsp",2) @CR
defmacro("DemoTopic","Outlier Replacement",2) @CR
dmf("MoreInfo.men") @CR

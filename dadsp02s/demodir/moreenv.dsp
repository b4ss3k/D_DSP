@pause(2)
!  MoreENV.dsp  the second part of the envelope stuff for the DADiSP 4.0 demo

@pop("p1",-1,-1,
"
    The envelope of a signal is particularly useful when    
  
    comparing a reference signal to another measured series.    
")
@pause(8)
@unpop("p1")
@pop("p1",-1,-1,
"
    Let's add some more windows and take a closer look.    
")
@pause(8)
@unpop("p1")
moveto(w4) @CR
addwin(4) @CR
moveto(w5) @CR
@pop("p1",-1,4,
"
     If you are comparing the same measured parameter from different     

     test runs, then there will be variations from test to test.
")
@pause(8)
@pop("p2",-1,15,
"
     For this discussion, we will create some new data    

     by adding noise to the original series.
")
@pause(8)
@unpop("p1") @unpop("p2")
w1+ gnorm(length(w1),deltax(w1),0.01,0.4*stdev(w1)) @CR
@CR ZOOM @CR
@pop("p1",-1,4,
"
     Here is the signal we want to compare     

     to the Reference Signal Envelope.      
")
@pause(8)
@unpop("p1") @ESC
@pop("p1",-1,15,
"
    Once again, we will overplot the envelope and zoom in.    
")
@pause(8)
@unpop("p1")
@RT
wincolor(white,lred);w5;overpl(w2,black);overpl(w3,black) @CR
@CR ZOOM @CR
@pause(3) @CNTL_RT @CNTL_RT @CNTL_RT @CNTL_RT @pause(4)
Setlinewidth(2,2);setlinewidth(2,3);setlinewidth(1,1) @CR
@pop("p1",-1,16,
"
    Notice how some of the data points are outside of the envelope.    
")
@pause(8)
@unpop("p1")
@pop("p1",-1,4,
"
    Let's identify how many points are outside the envelope.    
")
@pause(8)
@unpop("p1")
@ESC
@RT
(w6>w2) || (W6<w3);steps @CR setxy(Getxl(w6),getxr(w6),-0.25,1.25) @CR
@CR ZOOM @CR
@pop("p1",-1,15,
"
    This is a binary series which equals 1 wherever the series in W6     

    lies outside of the Reference Signal Envelope and equals 0 elsewhere.    
")
@pause(12)
@unpop("p1")
@pause(4)
@ESC
@RT
@pop("p1",-1,4,
"
    The number of ones in W7 is the number of points outside the envelope.    
")
@pause(8)
@pop("p2",-1,15,
"
    So, delete the zeros from W7, and find the length of the new series.    
")
@pause(8)
@unpop("p2")
@unpop("p1")

Gser(length(Delete(w7,w7==0)));tableview @CR
setcomment("Points");pon @CR
@CR ZOOM @CR
@pop("p1",-1,15,
"
     Here is the number of points outside    
 
     of the Reference Signal Envelope.    
")
@pause(8)
@unpop("p1")
@ESC
@pause(8)
dmf("AppTopic.men") @CR


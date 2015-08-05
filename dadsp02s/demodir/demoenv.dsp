@pause(2)

removewin(-1) @cr
addwin(4) @cr
@cntl_home
@pop("pop1",-1,4,
"                            REMEMBER:

   You can pause, speed-up or stop this demo at any time.

             To speed up the demo, press the SPACE BAR.  

             To interrupt the demo, click the STOP button.
")
@pause(6) @unpop("pop1")
@pop("pop1",-1,2,
"  
     This example illustrates some simple analysis techniques 

     for obtaining the envelope of a given signal.
")
@pause(8)
@pop("pop2",-1,12,
"
      With DADiSP, you can isolate     

    the peaks and valleys of a signal.    
")
@pause(6) @unpop("pop2") @unpop("pop1")
@pop("pop1",-1,2,
"
     Let's load some data into Window 1.     
") 
@pause(6) @unpop("pop1")

moveto(w1) @cr
loadseries("SPEECH.1.CHICKEN_LITTLE");label("Vibration Data") @cr @pause(2)

@pop("pop1",-1,15,
"
     First, identify all the peaks in the data.     
")
@pause(6) @unpop("pop1")
moveto(w2) @cr
getpeak(w1,0,1,1,2) @cr 
@cr 
zoom(w2) @cr @pause(4)
@esc

@pop("pop1",-1,4,
"     
     Next, identify all the valleys in the data.     
")
@pause(6) @unpop("pop1")
moveto(w3) @cr
getvalley(w1,0,1,1,2) @cr 
@cr 
zoom(w3) @cr @pause(4)
@esc

@pop("pop1",-1,4,
"
    Now, let's overplot the peaks and valleys onto the
     
    original data.  From this we can see the signal envelope.    
")
@pause(8) @unpop("pop1")
moveto(w4) @cr
wincolor(white,red);w1;overplot(w2,black);overplot(w3,black) @cr
@cr 
zoom(w4) @cr @pause(3)

@pop("pop1",-1,4,
"
    As you can see, the original signal fits nicely within the    

    envelope.  If we scroll through the data, we can get a 

    better visual understanding of what is happening.
")
@pause(12) @unpop("pop1")

@CNTL_RT @CNTL_RT @CNTL_RT @CNTL_RT @pause(4)
@pause(7) unzoom(w4) @cr @CNTL_HOME @esc
defmacro("MoreInfoDSPFile","MoreENV.dsp",2) @CR
defmacro("DemoTopic","Signal Envelopes",2) @CR
dmf("MoreInfo.men") @CR


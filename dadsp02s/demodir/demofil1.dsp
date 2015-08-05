@pause(2)
removewin(-1) @cr
addwin(6) @cr
@pause(1)
@pop("p1",-1,-1," DADiSP/Filters ")
@pause(3)
@unpop("p1")
echo("DADiSP/Filters") @cr

@pop("mes",-1,-1,
"
  Raw data acquired from electronic instruments is sometimes noisy,  

  containing unwanted interference that obscures the important data.  
")
@pause(8) @unpop("mes")
@pop("mes",-1,-1,
"
  You may want to eliminate the noise, so that your analysis results are  

  not tainted by the unwanted noise.  Or, it might be useful to extract  

  and investigate the noise to determine the source of the problem.  
")
@pause(10) @unpop("mes")
@pop("mes",-1,-1,
"
  Digital Filters help you separate the different components of your data.  

  You don't need to read books to learn about Digital Filter Design.
 
  DADiSP/Filters does it for you.
")
@pause(10) @unpop("mes")

@pop("mes", -1,-1,
"
  DADiSP/Filters lets you design, display and apply   

  digital filters using easy-to-follow pop-up menus.

  With the menus, you learn as you go. Here's an example 

  with DADiSP's filter design module.
") 
@pause(10)
@unpop("mes")
@pop("pop1",-1,-1,
"
  First, let's load some speech data into W1.  
")
@pause(5) @unpop("pop1")
moveto(w1) @cr
loadseries(w1,"SPEECH.1.CHICKEN_LITTLE",1) @cr @cr
zoom @cr @pause(3) 
@esc
@pop("p1",-1,12,
"  
  If we look at the spectrum of this signal, we will see the  

  magnitude of the signal and noise plotted against frequency.  
")
@pause(7) @unpop("p1")
moveto(w2) @cr
spectrum(w1) @cr @cr
zoom @cr @f5 @pause(3)
@pop("p1",-1,1,
"
  Let's say we want to remove all the magnitude/noise at all the high  

  frequencies greater than 650 hertz.  This is easy to do with DADiSP/Filters.  
")
@pause(8)
@unpop("p1")

@pop("p1",-1,1,
" 
  First, design a LOWPASS filter which will remove  

  all the noise at the higher frequencies.
")
@pause(8) @unpop("p1")

@esc
moveto(w3) @cr
setconf("yn_processing","1") @cr
lowpass(rate(w1),600.0,3.0,40.0,650.0) @cr
setconf("yn_processing","-1") @cr
@pop("pop1",-1,1,
"
  This is an FIR lowpass filter.  

  How can we tell?

  Look at the Magnitude Response of the filter.  
")
@pause(5) @unpop("pop1")
moveto(w4) @cr
FIRMAG(W3,512);scales(2) @CR
@CR zoom @CR @pause(5)
@pop("p1",-1,1,
"
  The Magnitude Response of the filter shows the frequencies  

  which will be passed or stopped by the filter in Window 3.  
")
@pause(8)  @unpop("p1")
@pop("p2",-1,1,
"
  Information at frequencies between 0 and 650 Hz will pass  

  through the filter, while everything above 650 Hz will be  

  attenuated, or 'stopped'.
")
@pause(8)   
@unpop("p2")
@ESC
moveto(w5) @CR
@pop("p1",-1,-1,
"
  Now, let's use the filter in Window 3 to  

  filter the original speech data from Window 1.  
") 
@pause(5) @unpop("p1")

filter(w1,w3) @cr
@pop("pop1",-1,4,
"
  The filtered data should have all the noise at frequencies greater  

  than 650 hertz removed.  Let's confirm this by looking at the spectrum.  
")
@pause(7) @unpop("pop1")
moveto(w6) @cr
spectrum(w5) @cr @cr 
zoom @cr @f5 @pause(3)
@esc

@pop("p1",-1,1,
"
  See how easy it was to remove the higher frequencies?  
")
@pause(5) @unpop("p1")

@pop("p1",-1,-1,
"
  Now watch how easy it is to remove all the lower frequency data.  
")
 
@pause(8) @unpop("p1")

@pop("p1",-1,12,
"
  To remove the low frequency contributions, we will design a  

  HIGHPASS filter.  Let's remove all the information below 650 Hertz.  
")
@pause(8) @unpop("p1")
@pop("p1",-1,12,
"
  We will change the filter in Window 3 from a LOWPASS to a HIGHPASS  

  and see how the rest of the Worksheet is recalculated for us.
")
@pause(8)
@unpop("p1")
moveto(w3) @cr
setconf("yn_processing","1") @cr
highpass(rate(w1),650.0,3.0,40.0,600.0) @cr
setconf("yn_processing","-1") @cr
@pause(5)
@pop("p1",-1,4,
"
  Notice how all the windows automatically updated when we changed  

  the filter design.  The resultant spectrum in Window 6 has all  

  the noise/magnitude from the lower frequencies removed.  
")
@pause(10) @unpop("p1")
@pause(5)
@pop("p1",-1,-1,
"
  With DADiSP/2002 and the Filters module, it is easy to acquire, design,  

  filter, and analyze your data in one interactive software package.  
")
@pause(6) @unpop("p1")
defmacro("MoreInfoDSPFile","MoreFilt.dsp",2) @CR
defmacro("DemoTopic","DADiSP/Filters",2) @CR
dmf("MoreInfo.men") @CR

@pause(2)

removewin(-1) @CR
addwin(6) @CR
moveto(w1) @CR
@pop("p1",-1,4,
"                        REMEMBER:

  You can pause, speed-up or stop this demo at any time

      To speed up the demo, press the SPACE BAR.

      To interrupt the demo, click the STOP button.
")
@pause(6) @unpop("p1")
@pop("p1",-1,-1,
"
  The Spectral Content of a signal provides a measure

  of the contributions of inputs at individual frequencies  

  to the waveform as a whole.
")
@pause(8)
@unpop("p1")
@pop("p1",-1,-1,
"
  The magnitude and frequency of various components

  in the frequency spectrum can provide useful information

  about the health or operation of the system.  For example, 

  some failure modes introduce abnormal frequency components.  
")
@pause(14)
@unpop("p1")
@pop("p1",-1,-1,
"
  Let's look at some vibration data, and determine the  

  major components in the frequency spectrum.
")
@pause(8)
@unpop("p1")
moveto(w1) @CR
Loadseries("Vibration.1.RSensor");label("Vibration.1.RSensor") @CR
moveto(w2) @CR
Spectrum(extract(W1-mean(W1),1,1024));sticks;label("Spectral Content"); @CR
scales(2) @CR
@CR
zoom @CR
@pop("p1",1,1,
"
  The Spectrum of the vibration data shows magnitude vs. frequency.  
")
@pause(8)
@unpop("p1")
@ESC
moveto(w3) @CR
@pop("p1",-1,-1,
"
  First, identify all the peaks in the spectrum...  
")
@pause(8)
@unpop("p1")
Getpeak(W2) @pause(1) @CR
moveto(w4) @CR
@pop("p1",-1,-1,
"
  Then, use a conditional to isolate the major peaks...  
")
@pause(8)
@unpop("p1")
W3>0.1 @CR
@CR ZOOM @CR
@pop("p1",1,1,
"
  This binary series is 1 at the major peaks and 0 elsewhere.  
")
@pause(8)
@unpop("p1")
@ESC
moveto(w5) @CR
setprec(4) @cr
@pop("p1",-1,-1,
"
  Multiply this series by the Spectrum X-axis to get the frequencies,  

  and by the Spectrum Values to get the magnitude at each frequency,

  then delete all the zeros.
")
@pause(12)
@unpop("p1")
Ravel(Delete(W4*xvals(W3),W4==0),delete(W4*W3,W4==0));tablev;label("Frequency Components") @CR
setcomment("Hz",1,1) @CR
setcomment("Ampl",1,2) @CR
@CR ZOOM @CR
@pop("p1",1,1,
"
  What remains is a table of Frequency and Amplitude values.  
")
@pause(8)
@unpop("p1")
@ESC
moveto(w6) @CR
setprec(-1) @cr
@pause(8)
dmf("apptopic.men") @CR


@pause(2)

@CNTL_HOME clearall @CR
@pop("p1",-1,-1,
"
  Let's take a closer look at DADiSP/Filters.  
")
@pause(5)
@unpop("p1")
@pop("p1",-1,-1,
"
  In the previous example, we created an FIR filter.  

  Here, let's use an IIR filter to filter our data.  
")
@pause(5)
@unpop("p1")
@pop("pop1",-1,-1,
"
  First, load some noisy data in W1.  
")
@pause(3) @unpop("pop1")
removewin(-1) @cr
addwin(6) @cr
echo("DADiSP/Filters") @cr
@CNTL_HOME

Gsin(256,1/256,4)+gnorm(256,1/256,0,0.3);label("Noisy Data") @CR
@pause(3)

@pop("pop1",-1,-1,
" 
  Calculate the spectrum to see the magnitude  

  of the signal and noise at various frequencies.  
")
@pause(6) @unpop("pop1")
moveto(w2) @CR
Spectrum(w1) @CR
@pause(3)
@pop("pop1",-1,-1,
"
  Let's filter out the noise using DADiSP/Filters.  
")
@pause(5) @unpop("pop1")
moveto(w3) @CR

butterworth(1,256.0,10.0,3.0,40.0,20.0) @CR @pause(5)
@pop("pop1",-1,1,
"
  In Window 3, we created an IIR Lowpass  
  
  Butterworth filter to eliminate the noise.  
")
@pause(6) @unpop("pop1")
moveto(w4) @CR
@pop("p1",-1,1,
"
  Next, check the magnitude response of the IIR filter  

  to make sure it has the characteristics we want.  
")
@pause(6) @unpop("p1")
IIRMAG(w3,512);scales(2) @CR
@CR zoom @CR
@pause(5)
@pop("p1",-1,1,
"
  There is a nice flat passband to 10 Hz, and a long slow rolloff.  
")
@pause(6)
@unpop("p1") @ESC
@pop("pop1",-1,1,
"
  Now we apply the filter in Window 3 to the noisy data in Window 1.  
")
@pause(7) @unpop("pop1")
moveto(w5) @cr
iirfilter(w1,w3) @CR @pause(5)
@pop("pop1",-1,-1,
"        
  The noise has been removed and the data  

  now looks similar to a clean sine wave.  
")
@pause(8) @unpop("pop1")
@CR zoom @CR
@pop("p1",-1,3,
"  But wait...we introduced a phase lag when we filtered.  ")
@pause(6)
@unpop("p1")
overplot(w1,lred) @CR
@pause(6)
@pop("p2",-1,20,
"
  The red waveform is the original noisy data.  
")
@pause(6)
@unpop("p2")
@ESC
@pop("p1",-1,1,
"
  With IIR Filters, you can remove the phase lag by 'reverse'  

  filtering.  That is, run the data back through the IIR filter.  
")
@pause(10)
@pop("p2",-1,6,
"
  Use the REVERSE function to flip the data in time,  

  then, refilter the data, and flip in time again.  
")
@pause(8)
@unpop("p2") @unpop("p1")
moveto(w6) @CR
reverse(w5) @CR
@cr zoom @CR @pause(5)
@pop("p1",-1,1,
"
  Here the series is reversed in time.  
")
@pause(6) 
@unpop("p1")
@ESC
addwin(3) @CR
moveto(w7) @CR
@pop("p1",-1,-1,
"
  Now, we send the data back through the IIR filter.  
")
@pause(6)
@unpop("p1")

IIRFILTER(w6,w3);reverse(curr) @CR

@cr zoom @CR @pause(5)
overplot(w1,lred) @CR
@pop("p1",-1,1,
"
  Notice that the phase lag has been removed.  
")
@pause(6)
@unpop("p1")

@pop("pop1",-1,-1,
"
  Now let's calculate the Spectrum again on the filtered data.  
")
@pause(6) @unpop("pop1")
@ESC
moveto(w8) @CR
spectrum(w7) @CR @pause(5)
@pop("p1",-1,-1,
"
  The spectrum shows how we removed the noise.  
")
@pause(6)
@unpop("p1")
clear(w5..w9) @cr
display(w3,w4,w5,w6) @CR
moveto(w4) @CR

@pop("pop1",-1,4,
"
  DADiSP/Filters lets us look at the characteristics of  

  the Butterworth Lowpass filter we just designed.  
")
@pause(8)

@pop("pop2",-1,12,
"
  We can look at the Pole/Zero plot of the filter.  
")
@pause(6) @unpop("pop2") @unpop("pop1")

moveto(w5) @cr
iirpz(w3) @cr @cr
zoom @cr @pause(3)
@pop("pop1",-1,1,
"
  The poles of the filter are marked with crosses,  

  while the zeros are marked with circles.  
")
@pause(6) @unpop("pop1") @pause(3) @esc
moveto(w6) @cr
@pop("pop1",-1,6,
" 
  Finally, let's examine the phase response of  

  the Lowpass Butterworth filter in Window 3.
")
@pause(8) @unpop("pop1")
unwrap(iirphase(w3,512)) @cr @cr
zoom @cr @pause(5)
@esc
@pop("pop1",-1,-1,
"
  DADiSP/Filters helped us separate our experimental data  

  from the unwanted noise. Unlike specialized filter design  

  packages, we can continue to process our filtered data  

  using the full power of DADiSP. 
")
@pause(10) @unpop("pop1") 


@pop("p1",-1,-1,
"
  DADiSP/Filters is a powerful module which allows you to  

  design, test, and use digital filters in an integrated 

  analysis environment: the DADiSP Worksheet.
")
@pause(10)
@unpop("p1")

@CNTL_HOME 
!END OF EXAMPLE  
dmf("DemModul.men") @CR

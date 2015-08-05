@pause(2)

removewin(-1) @cr
addwin(4) @cr
@pause(1)
@pop("p1",-1,-1,"DADiSP/AdvDSP")
@pause(4)
@unpop("p1")

macread("demodir\demoadsp.mac") @CR
echo("DADiSP/AdvDSP") @CR

@pop("p1", -1, -1, 
"
 DADiSP/AdvDSP is a menu driven module which performs 

 a wide variety of advanced DSP algorithms.
") 
@pause(6)
@unpop("p1")
@pop("p1", -1, -1, 
" 
 DADiSP/AdvDSP includes:

   - Advanced FFT Analysis

   - Power Spectral Density Estimation

   - Digital Interpolation

   - Cepstrum Analysis
") 
@pause(6)
@unpop("p1")

@pop("p2", -1, -1, 
"
 These tools are arranged in an easy-to-use 

 menu format to make work more efficient

 by switching the bulk of your time from

 adjusting software to performing actual

 analysis.
") 
@pause(6)
@unpop("p2")
ad @cr
@pause(3)
@cr
@pop("p2", 30, 8, 
"
 The FFT Analysis section includes functions  

 for calculating an N-Point FFT, a ZOOM FFT 

 or a Chirp Z Transform. 
") 
@pause(9)
@unpop("p2")
@esc
@dn
@pause(2)
@cr
@pop("p3", 30, 8, 
"
 The PSD Analysis section includes classical, 

 FFT Based methods, as well as parametric modeling 

 techniques:  Autoregressive (AR), Moving Average (MA),

 and Autoregressive Moving Average (ARMA).
") 
@pause(9)
@unpop("p3")
@esc
@dn
@pause(2)
@cr

@pop("p3", 30, 8, 
"
 The Cepstrum Analysis section allows the user to 

 calculate the Real and Complex Cepstrum.
") 
@pause(9)
@unpop("p3")
@esc
@dn
@pause(2)
@cr

@pop("p4", 30, 8, 
"
 The Digital Interpolation section includes 

 functions to interpolate series. Digital  

 Interpolation adds points between existing 

 points in the series. 
") 
@pause(9)
@unpop("p4")
@esc
@esc

@pop("p7", -1, -1, 
"
 The advantage of using DADiSP/AdvDSP lies not only in the

 ease of using the basic tools, but also in the ease of analysis 

 in the DADiSP Worksheet environment.
") 
@pause(8)
@unpop("p7")


@pop("p1", -1, -1, 
"
 Let's take a closer look at some of the 

 functions available in DADiSP/AdvDSP. 
") 
@pause(8)
@unpop("p1")

moveto(w1) @CR
loadseries("SPEECH.1.CHICKEN_LITTLE");decim(curr,2);label("SPEECH.1.CHICKEN_LITTLE") @CR
setvunits("Volts") @cr
@pop("p1",-1,-1,
"
 We are interested in the frequency content

 of the speech data:  someone saying the phrase

 'Chicken Little'.
")
@pause(8)
@unpop("p1")

@pop("p1",-1,-1,
"
 We could just look at the spectrum of the data... 
")
@pause(6)
@unpop("p1")
moveto(w2) @cr
spectrum(w1) @cr

@F10

@pop("p1", -1,5,
"
 The spectrum shows the magnitude at frequencies

 from 0 Hz to the Nyquist Rate (1/2 sampling rate). 
")
@pause(10)
@unpop("p1")
@esc

@pop("p1",-1,-1,
"
 This is fine, but, what if you wanted to see 

 more detail in a specific frequency band? 
")
@pause(8)
@unpop("p1")
@pop("p1",-1,8,
"
 You could zero pad the speech data, calculate

 the spectrum on the new series, then zoom in 

 on the frequencies of interest in the plot...
")
@pause(8)
@unpop("p1")
@pop("p2", -1,-1,
"
 Or, you could calculate a Zoom FFT on that 

 specific frequency band.  The Zoom FFT allows you

 to set the desired number of points in the output

 series, and hence, the frequency bin spacing.
")
@pause(12)
@unpop("p2") 
setconf("status_Processing","0") @CR
moveto(w3) @cr
ad @cr
@pause(1)
@cr
@dn @pause(2) @cr   !choose zoom fft
w1 @NEXT_FIELD 256 @NEXT_FIELD 100.0 @NEXT_FIELD 200.0 @NEXT_FIELD
@pause(3)

@cr
sethunits("Hertz") @cr
@F5
@F10
@pause(4)
@pop("p1",-1,1,
"
 The Zoom FFT shows the frequency content between 100 and 200 Hz.
")
@pause(6)
@unpop("p1")
@ESC
moveto(w4) @cr
@pop("p1",-1,-1,
"
 Let's compare the output from the Zoom FFT with that

 of the spectrum in Window 2.
")
@pause(8)
@unpop("p1")

mag(w3)/length(w2);scales(2);label("100 - 200 Hz") @cr
overplot(w2,lred) @cr

@F10
sety(0,4) @cr
@pause(6)
@pop("p1",-1,4,
"
 The Zoom FFT does a good job of matching

 the output of the spectrum without calculating

 the spectrum of a series padded with many zeros.
")
@pause(8)
@unpop("p1")
@CNTL_RT
@CNTL_RT
@pop("p1",-1,4,
"
 The advantage is that you can specify the length of

 the output series to get the desired bin spacing.
")
@pause(8)
@unpop("p1")

! vertical cursor 
pdc(2075) @cr

@RT @pause(1) @RT @pause(1) @rt @pause(1)
@pop("p1",-1,-1,
"
 The frequency spacing of the bins is 0.3906 Hz.
")
@pause(6)
@unpop("p1")

@pop("p1",-1,-1,
"
 The frequency spacing of the bins on the original data is 1.9531 Hz.
")
@pause(6)
@unpop("p1")
@ESC
@pause(2)
@CNTL_HOME
@ESC


@pop("p1",-1,-1,
"
There are many more functions available in DADiSP/AdvDSP.

To explore the menus, type 'AD' at the command line.
")
@pause(10)
@unpop("p1")
@pop("p1",-1,-1,
"
 With DADiSP/2002 and the Advanced DSP module it is easy 

 to analyze the frequency characteristics of time series  

 in one menu driven interactive software package.
")
@pause(12) @unpop("p1")
setconf("status_Processing","1") @CR
defmacro("MoreInfoDSPFile","MoreADSP.dsp",2) @CR
defmacro("DemoTopic","DADiSP/AdvDSP",2) @CR
dmf("MoreInfo.men") @CR


@pause(1)

moveto(w4) @CR
addwin(2) @CR

@pop("p1", -1, -1, 
"
 One of the advantages to using DADiSP/AdvDSP is that 

 it is integrated with the DADiSP environment.  You 

 can use the spreadsheet to your advantage.
") 
@pause(6)
@unpop("p1")

@pop("p1",-1,-1,
"
 Let's examine the PSD estimation techniques in the

 Advanced DSP module.
")
@pause(6)
@unpop("p1")
moveto(w5) @cr
ad @cr
@pause(1)
p @pause(1)
@cr
p @pause(3)
@cr
@pause(3)
@pop("p1",40,12,
"
 The parametric PSD techniques include

 Autoregressive, Moving Average, and 

 Autoregressive Moving Average.  

 We will use the AR Model.
")
@pause(8)
@unpop("p1")
@cr    ! choose AR 
@pop("p1",40,12,
"
 There are a variety of methods to 

 calculate the AR coefficients.  We

 will choose the Levinson Recursion 

 (Yule-Walker) Method for this example.
")
@pause(10)
@unpop("p1")
@cr
@pause(1)
w1 @NEXT_FIELD 10 @pause(2)
@cr
@F10
tablev @CR
@pop("p1",40,12,
"
 This is a series of the AR coefficients

 which model the frequency content of the 

 speech data in Window 1.
")
@pause(10)
@unpop("p1")
!lines @CR
@pause(2)
@ESC
moveto(w6) @cr
@pop("p1", -1, -1, 
"
 Now, let's see what the AR Coefficients from Window 5 

 indicate the frequency spectrum contains, and then 

 compare it with the spectrum of the data.
")
@pause(12)
@unpop("p1")
ad @cr
@pause(1)
p @pause(1) @cr
p @pause(1) @cr
@pause(1) 
@cr
@DN @DN @DN @pause(2) @cr
@pause(1)
w5 @NEXT_FIELD 256 @pause(3)
@cr
lines;sercolor(lred) @CR
addwf("setlinewidth(2)") @Cr
@pause(3)
addwf("overplot(w2,lpurple)") @cr
@F10
@pause(2)
@pop("p1",-1,1,
"
 Notice that the 10 AR coefficients in Window 5 do a fairly good job 

 of representing the major peak (~480 Hz) in the speech data spectrum. 
")
@pause(12)
@unpop("p1")
@esc
@pop("p1",-1,-1,
"
 Now, let's use the spreadsheet to our advantage, and

 see whether we can represent the other peaks in the 

 spectrum by changing the number of coefficients in 

 the Autoregressive model in Window 5.
")
@pause(14)
@unpop("p1")
@pop("p1",-1,-1,
"
 We'll move to Window 5, change the number of 

 coefficients in the AR model from 10 to 50, 

 and let the worksheet recalculate.
")
@pause(12)
@unpop("p1")

moveto(w5) @cr
Lev(w1,50) @cr
moveto(w6) @cr
@F10
@pause(3)
@pop("p1",-1,1,
"
 Notice how the AR effectively models the other peaks in the spectrum

 around 150 Hz, 325 Hz, and 560 Hz.
")
@pause(14)
@unpop("p1")
@esc

@pop("p1",-1,-1,
"
  Parametric Spectrum Estimation allows you to model the frequency 

  content of your data, and represent it with a fewer number of points  

  than by simply using the Spectrum function. 

  In this example, the spectral content represented in W2 by 1025 points  

  has been effectively modeled by 50 AR coefficients in Window 5.
")
@pause(16)
@unpop("p1")


@pop("p1", -1, -1, 
"
 The features and functions in the DADiSP/AdvDSP Module 

 supplement the existing signal processing functions of 

 the DADiSP Worksheet, and complement the DADiSP/Filters

 Module for FIR and IIR Filter design and analysis.
") 
@pause(10)
@unpop("p1")

@pop("p1",-1,-1,
"
 Integrated with the DADiSP Worksheet (TM), 

 DADiSP/AdvDSP is a powerful tool for digital 
 
 signal processing.
")
@pause(10)
@unpop("p1")
@pause(4)
dmf("DemModul.men") @CR

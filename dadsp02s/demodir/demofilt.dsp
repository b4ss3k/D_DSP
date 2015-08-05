@CNTL_HOME clearall @CR
macread("filter.mac") @cr
Run(strcat(DEMOHOME, "delfir"),-2) @CR
@pop("mes",-1,-1,
"
  Raw data acquired from electronic instruments is sometimes noisy,

  containing unwanted interference that obscures the important data.  
")
@pause(8) @unpop("mes")
@pop("mes",-1,-1,
"
  You may want to eliminate the noise, so that your analysis results  

              are not tainted by the unrelated noise.

   Or it might be useful to extract the noise to investigate the  

              noise and find the source of the problem.  
")
@pause(8) @unpop("mes")
@pop("mes",-1,-1,
"
  Digital Filter design techniques helps you separate different  

                    components of your data.

         You don't need to read books to learn about it.

                  DADiSP/Filters does it for you.
")
@pause(8) @unpop("mes")

@pop("mes", -1,-1,
"
  DADiSP/Filters lets you design, display and apply filters  

              using easy-to-follow pop-up menus.

             With the menus, you learn as you go.

      Here's an example with DADiSP's filter design module.
") 
@pause(7)
@unpop("mes")
@pop("pop1",-1,-1,
"
  First, we add some windows and create some data in W1.  
")
@pause(3) @unpop("pop1")
removewin(-1) @cr
addwin(6) @cr
echo("DADiSP/Filters") @cr
@pause(3)
@CNTL_HOME


! MAYBE USE MENUS TO DO THIS
Gsin(256,1/256,4) @CR
@pause(2)


@pop("pop1",-1,-1,
"
  Now, we add some 'noise' to our data series.  
")
@pause(3) @unpop("pop1")
@RT
W1*Grand(256,1/256,0.5,5) @CR
@pause(3)
@pop("pop1",-1,-1,
" 
  If we perform a spectrum, we see magnitude/noise at various frequencies.  
")
@pause(5) @unpop("pop1")
@RT
Spectrum(w2) @CR
@pause(3)
@pop("pop1",-1,-1,
"
  Let's try to filter out the noise at the higher frequencies 
                 
                     using DADiSP/Filters.  
")
@pause(5) @unpop("pop1")
@RT


! MENUS ARE NO GOOD
! dmf("demofila.men") @CR
! @pause(4)
! @CR
! @pause(4)
! @CR
! @pause(3)
! @END



! USE MENUS TO DO THE FILTER DESIGN
butterworth(1,256.0,10.0,3.0,40.0,20.0) @CR @pause(5)
@pop("pop1",-1,-1,
"
        We created a Butterworth Lowpass filter using the  
  
        menus to eliminate noise in the higher frequencies.  
")
@pause(6) @unpop("pop1")
@pop("pop1",-1,-1,
"
  Now we apply the filter in Window 4 to the noisy data in Window 2.  
")
@pause(7) @unpop("pop1")
moveto(w5) @cr
iirfilter(w2,w4) @CR @pause(5)
@pop("pop1",-1,-1,
"        
           The noise has been removed and the data

   now looks very similar to the original data in Window 1.  
")
@pause(5) @unpop("pop1")
@pop("pop1",-1,-1,
"
  Now we calculate the Spectrum again on the filtered data.  
")
@pause(5) @unpop("pop1")
@RT spectrum(w5) @CR @pause(5)
@pop("pop1",-1,8,
"
  Notice in the spectrum how we filtered out all the noise/energy

              beginning from a specified frequency.

")
@pause(8) @unpop("pop1") @pause(5)
@pop("pop1",-1,6,
"
   Lets overplot the filtered spectrum on the original spectrum and

   see how the spectrums changed of the filtered and original data.
")
@pause(5) @unpop("pop1")
moveto(w6) @cr
overplot(w3,lred) @cr @cr
zoom @cr
@pop("pop1",-1,10,
"
        Notice how the noise was removed from the higher frequencies

        in the filtered spectrum in yellow.
")
@pause(5) @unpop("pop1") @pause(4) @esc

@pop("pop1",-1,-1,
"
  DADiSP/Filters helped us separate the experimental data  

  from unwanted noise. Unlike specialized filter design 

  packages, we can continue to process our filtered data  

          using the full power of DADiSP/2002.
")
@pause(8) @unpop("pop1") @pause(10)

display(w4);addwin(3) @cr

@pop("pop1",-1,4,
"
           Now lets look at some interesting characteristics of

              the Butterworth Lowpass filter we just designed.  
")
@pause(5)

@pop("pop2",-1,12,
"
            First lets take a look at the Pole/Zero plot of the

        filter.  What we'll see is the poles and zeros plotted over

        the unit circle.
")
@pause(6) @unpop("pop2") @unpop("pop1")

moveto(w5) @cr
iirpz(w4) @cr @cr
zoom @cr
@pop("pop1",-1,-1,
"
      Now we can see all the poles and zeros of our designed filter.

  The poles are marked with crosses and the zeros marked with squares.
")
@pause(5) @unpop("pop1") @pause(3) @esc
moveto(w6)
@pop("pop1",-1,6,
" 
       Now lets look at the magnitude response of our designed Lowpass

       Butterworth filter.  What we'll see is a frequency domain series

       with the magnitude in (db).
")
@pause(7) @unpop("pop1") 
iirmag(w4,512) @cr @cr 
zoom @cr @pause(4)
@esc
moveto(w7) @cr
@pop("pop1",-1,6,
" 
       Finally, lets take a look at the phase respone of our designed

       Lowpass Butterworth filter.  What we'll see is a frequency domain

       series with the phase in radians.
")
@pause(7) @unpop("pop1")
unwrap(iirphase(w4,512)) @cr @cr
zoom @cr @pause(4)
@esc



@CNTL_HOME @RT 
! @ESC @pause(3) 


! MAYBE USE MENUS
! Removewin(5) @CR @pause(4)


demo @CR
@DN @DN @DN @DN @DN @DN
@SUSPEND("@CR @ESC")
@RETURN

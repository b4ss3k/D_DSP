@pause(1)

removewin(-1) @CR
addwin(4) @CR

@pop("pop1",-1,-1,
"
  GPIBLab can control and collect data directly 

       from your IEEE-488 based instruments.  
")
@pause(6)
@unpop("pop1")
@pop("pop1",-1,-1,
"
  Using GPIBLab, DADiSP can interface to any instrument 
 
  that uses the IEEE-488 protocol,  including:

         - popular oscilloscopes from
           Hewlett Packard, Nicolet, Tektronix and more
             
         - acquisition systems
          
         - voltmeters
         
         - gauges

          and other laboratory and process monitoring equipment.
")
@pause(11) @unpop("pop1")

@CNTL_HOME echo("GPIBLab") @cr @pause(1)
@pop("pop1",-1,-1,
"
  Interfacing directly to the instrument eliminates the need to:  

          - write an instrument device driver
          - write a file conversion program
          - waste valuable processing time
          - PROGRAM

  GPIBLab saves you time, energy, and frustration, and most important . . .

                             It makes you more productive!
")

@pause(11) @unpop("pop1")
@pop("pop1",-1,-1,
"  
  GPIBLab uses DADiSP's easy-to-understand pop-up 

  menus,  custom-designed for your particular instrument.

  The following screens will simulate a GPIBLab session  

  using a menu interface designed for an oscilloscope.  
")
@pause(12) @unpop("pop1")
! we need to see the changes here, so turn input line on, then off again
setconf("COMFILE_INPUT_PROCESSING","1") @CR


demomr("gpiblab.mac") @CR

gmf("startup.gpl") @CR  @pause(2) 
D @pause(2)
@CR @pause(2)
@CR
@pop("pop1",15,20,
" These are examples of GPIBLab menus. They can be tailored 

    to your application without any programming at all.  ")
@pause(7) @unpop("pop1")
Q @pause(3) @CR @pause(5)
@ESC @pause(3)

@pop("pop1",15,20,
" 
Let's change a few of the settings for Channel 1.
")
@pause(4) @unpop("pop1")
V @pause(2) @CR @pause(2)
5 @pause(3) @CR
T @pause(3)  @CR @pause(2)
.1 @pause(3) @CR
@pop("pop1",15,20,
"  Now that we have changed the setup, let's look at 
 
           the new settings for Channel 1.   ")

@pause(5) @unpop("pop1")
Q @pause(3) @CR @pause(5) @ESC
@pop("pop1",15,20,
"  We modified the setup of Channel 1, now let's 

   change the acquisition rate of the scope.  ")

@pause(4) @unpop("pop1")
@pause(2) @ESC
S  @pause(3) @CR
!S  @pause(3) @CR @pause(2)
256 @pause(4) @CR
@pop("pop1",-1,-1,
" 
  Let's acquire the data. 
")
@pause(3) @unpop("pop1")
 R  @pause(2) @CR
@pause(3)

@cr @pause(5)
@pop("pop1",-1,-1,
"
 The data has been acquired into Window 1.
")
@pause(4) @unpop("pop1")
@pop("pop1",-1,-1,
"
  Since the data is imported directly into a window, you can

  perform any DADiSP Worksheet function on it immediately, 
  
  including SAVING the data permanently.  
")


@pause(8) @unpop("pop1")
setconf("COMFILE_INPUT_PROCESSING","0") @CR

moveto(w2) @CR W1-Mean(W1) @CR
moveto(w3) @CR Hamming(W2) @CR
moveto(w4) @CR 20*log10(Spectrum(W3)) @CR
scales(2) @CR
@PAUSE(7)

@pop("p1",-1,-1,
"
   You can set up your DADiSP Worksheets as templates

   and then run many acquisitions consecutively.  As

   the data in Window 1 is updated with each acquisition,

   the rest of the Worksheet automatically calculates.
")
@pause(11)
@unpop("p1")
moveto(w1) @CR
clear @CR
@pause(3) 
@pop("p1",-1,-1,
"  Here is a template Worksheet.  ")
@pause(5)
@unpop("p1")
@pop("p1",-1,-1,
"  Now, we can run multiple acquisitions.  ")
@pause(5)
@unpop("p1")
M @CR
D @pause(2) @CR
@pause(2)
R @CR
@pause(2)
@CR
@pause(3)
clear(w1) @CR
dmf("datain.gpl") @CR
@pause(2) 
@CR
@pause(3)
clear(w1) @CR
dmf("datain.gpl") @CR
@pause(2) 
@CR
@pop("p1",-1,-1,
"  It's easy to acquire LOTS of data!  ")
@pause(5)
@unpop("p1")

@pop("pop1",-1,-1,
"
  DADiSP and GPIBLab save you time and effort by performing  

  the Data Acquisition AND Data Analysis in ONE package  

  with a single menu-driven, graphical interface.  


  To look through the sample menus of GPIBLab, type 
   
  M at the DADiSP command line during the interactive demo.
")
@pause(12) @unpop("pop1")
@pause(3) 
@CNTL_HOME
@RT
removewindow(3) @CR

dmf("DemModul.men") @CR

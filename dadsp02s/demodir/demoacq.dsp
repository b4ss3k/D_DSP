@pop("pop1",-1,-1,
"
DADiSP supports high-speed A/D data acquisition from a variety

              of popular, industry-standard boards.
") @pause(7) @unpop("pop1")
@pop("pop1",-1,-1,
"
  Including boards from:

      Advantech
      Analog Devices
      Burr-Brown
      Data Translation
      MetraByte
      National Instruments  
      Scientific Solution 

      and other vendors.
")@pause(10) @unpop("pop1")
@pop("pop1",-1,-1,
"
  You can collect data directly into a DADiSP Worksheet.  
")
@pause(5) @unpop("pop1")
@pop("pop1",-1,-1,
"
  The data acquisition interface is fully menuized and   
    
           customized to your particular board. 
")
@pause(4) @unpop("pop1")
@pop("pop1",-1,-1,
"
  So data collection requires:

         No software Setup,
         No programming messy device drivers,
         And no learning a second, acquisition-specific program  
") @pause(8) @unpop("pop1")
@pop("pop1",-1,-1,
"
  You can use a single, menu-driven software package for  

  data collection AND data analysis . . . the DADiSP Worksheet.  
") @pause(8) @unpop("pop1")
@pop("pop1",-1,-1,
"
  Once your data is in DADiSP, you can apply any of DADiSP's  
  
  hundreds of graphics and analysis functions to your raw data.  
") @pause(5) @unpop("pop1")
@pop("pop1",-1,-1,
"
  The following screens will simulate a sample DADiSP acquisition  

  session using DADiSP's data acquisition menu interface.
")
@pause(7) @unpop("pop1")
removewin(-1) @cr
addwin(2) @cr
@cntl_home
echo("DADiSP/LT") @cr
@pause(2)
trig @CR



! Can't do this menu stuff  
! lt1 @CR
! @pause(5) T @pause(3)  T @pause(3) @ESC



acq1 @CR
@RT 
acq2 @CR
@pause(8)
@pop("pop1",-1,-1,
"  
  We collected 2 channels of data.  
")
@pause(5) @unpop("pop1")
@pop("pop1",-1,-1,
"
  Now the data is ready for analysis, storing or plotting.  
")
@pause(5) @unpop("pop1")
@ESC 


! MAYBE USE THE MENUS
Removewin(1) @cr @pause(2) 
! @cr E @pause(3)


demo @CR
@DN @DN @DN @DN @DN
@SUSPEND("@CR @ESC")
@RETURN

removewin(-1) @cr
addwin(1) @cr
@cntl_home


! CHANGE TO MENUS
loadseries("SPEECH.1.CHICKEN_LITTLE") @CR @pause(3) @CR



@pause(3)  @cntl_rt @cntl_rt @cntl_rt @cntl_rt @cntl_rt @cntl_rt @cntl_rt @pause(3)
@pop("pop1",-1,-1,
"  DADiSP offers you many different VIEWS on your data.  

             - Line Graphs

             - Symbol Plots
 
             - Event (Pulse) Plots

             - Bar Graphs

             - Matrices and Tables

             and a variety of 3-D graphical views.  
")
@pause(7) @unpop("pop1")
@pop("pop2",-1,20,
"     The data first appears as a line graph.     ")
@pause(3) @unpop("pop2")
@f7 setsym(1) @CR @pause(3) setsym(0) @CR @pause(1)
@f7 @pause(3) 
@f7 @pause(3)
@f7 @pause(5) 
@F9 @pause(2) @DN @pause(2)  @DN @pause(2) @DN @pause(2) @RT @Pause(2)
@ESC
@pop("pop2",-1,20,
"   Any DADiSP window can be viewed in this way.  ") @pause(6)
@unpop("pop2")

@pause(3)  @F7 

@pop("pop1",-1,-1,
" 
  We can add free form text and lines to our graph.  
")

@pause(3) @unpop("pop1")
textcur(1,yellow,black,0,1,1) @cr 
@cntl_up @cntl_up @pause(1) 
@cntl_lf @cntl_lf @pause(1)
@sp Max: @sp {strnum(max)} @sp @pause(2) @cr @esc @pause(4)
@pop("pop1",-1,-1,
"
  We can re-scale the graph.  
")

@pause(3) @unpop("pop1") @CNTL_HOME @pause(3)
@pop("pop1",-1,-1,
"
Here is an example of a Worksheet containing Presentation-Quality Output...
")
@pause(4) @unpop("pop1") 
@ESC 
! @ESC



! CHANGE TO THE MENUS
Loadworksheet("QCPLOT") @pause(8) @cr



@pop("mes", -1,-1,
"
  Use DADiSP's printing or plotting features to include graphs  
         
           like this in your reports and presentations.
") 
@pause(10)
@unpop("mes")
@pop("mes",-1,-1,
"
  DADiSP supports a variety of printing and plotting devices and formats.  
")
@pause(7)
@unpop("mes")
@pop("pop1",-1,-1,
"  DADiSP supports:
    
    - Color PostScript

    - Monochrome PostScript

    - and HPGL Plotter Format  

  for a variety of plotters.
")
@pause(10) @unpop("pop1")
@pop("pop1",-1,-1,
"
  And you may choose from a variety of printer drivers included with  

                     the DADiSP software package.
")
@pause(10) @unpop("pop1")
@pop("pop1",-1,-1,
"
  From DADiSP, you can print all of the Worksheet Windows or a subset.  
")
@pause(7) @unpop("pop1")
@pop("pop1",-1,-1,
"
  And the Windows are printed or plotted directly on the hardcopy device,  

  requiring no interaction with the operating system or temporary files.
")
@pause(10) @unpop("pop1")


! E 


demo @CR
@DN @DN @DN @DN @DN @DN @DN
@SUSPEND("@CR @ESC")
@RETURN

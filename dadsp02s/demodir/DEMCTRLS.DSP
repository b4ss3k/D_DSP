@pause(2)
removewin(-1) @cr
addwin(6) @cr
@pause(1)
@pop("p1",-1,-1,"DADiSP/Controls")
@pause(4)
@unpop("p1")
macread("demodir\democtrl.mac") @CR
splread("demodir\democtrl.spl") @CR
echo("DADiSP/Controls") @CR

@pop("p2", -1, 8, 
" DADiSP/Controls is a menu driven module which 

 allows for the easy and accurate design and

 analysis of both continuous and discrete 

 single-input/single-output (SISO) systems. ") 
@pause(9)
@pop("p3", -1, 15, 
" DADiSP/Controls models these systems as the 

 ratio of polynominal series in either the 

 Laplace variable S or the discrete variable Z. ") 
@pause(9)
@unpop("p3")
@unpop("p2")
@pop("p2", -1, -1, 
" Once a model has been developed, DADiSP/Controls 

 is equipped with all of the major tools for SISO

 design and analysis. ") 
@pause(9)
@unpop("p2") 

@pop("p2", 32, 10, 
" These tools are arranged in an easy-to-use 

 menu format to make work more efficient

 by switching the bulk of your time from

 adjusting software to performing actual

 analysis.") 
@pause(6)
CC@cr
@pause(8)
@unpop("p2")
@cr
@pop("p2", 36, 8, 
" The Model Building section includes functions 

 for the development of an accurate system model. ") 
@pause(12)
@unpop("p2")
@esc
@dn
@cr
@pop("p3", 36, 8, 
" The Frequency Response section allows for 

 Bode and Nyquist plots of both discrete and 

 continuous systems to be produced and 

 analyzed.") 
@pause(12)
@unpop("p3")
@esc
@dn
@cr

@pop("p3", 36, 8, 
" The Pole-Zero section allows the user to 

 verify pole and zero locations and perform 

 the Root Locus method for designing 

 closed-loop systems.") 
@pause(12)
@unpop("p3")
@esc
@dn
@cr

@pop("p4", 36, 8, 
" The Time Response section includes functions 

 to produce simulations and calculate the 

 system response to several characteristic 

 inputs, such as steps, ramps, or your own 

 time history simulation.") 
@pause(12)
@unpop("p4")
@esc
@dn
@cr

@pop("p5", 36, 8, 
" The Controllers section allows for the quick 

 design of PID controllers and an effective 

 interactive method for design of Lag and Lead 

 compensators.") 
@pause(12)
@unpop("p5")
@esc
@dn

@pop("p5", 36, 8, 
" The Design 2nd Order section provides the 

 user with an interactive method for the 

 simultaneous design of systems in both the

 frequency and time domains.") 
@pause(12)
@unpop("p5")
@esc

@pop("p7", -1, -1, 
" The advantage to using DADiSP/Controls lies

 not only in the ease of using the basic tools, 

 but also in the ease of analysis in the DADiSP  

 environment.") 
@pause(8)
@unpop("p7")


@pop("p1", -1, -1, 
" Let's take a closer look at some of the 

 functions available in DADiSP/Controls. ") 
@pause(8)
@unpop("p1")
@pop("p2", -1, -1, " Bode Plot Analysis for Continuous Systems ") 
@pause(5)
@unpop("p2")
Moveto(w1)@cr
gser(3,-1,1)*7/3@cr
label("Numerator")@cr
moveto(w2)@cr
gser(7,7,2,1)@cr
label("Denominator")@cr
setfunit(0,0,0)@cr
@pop("p1",-1,-1,
" Windows 1 and 2 contain the numerator and the

 denominator of the transfer function for the model. ")
@pause(8)
@unpop("p1")

Cc@cr
@pause(2)
F @CR
@pause(2)
B
@pop("p1",40,8,
" The numerator and denominator windows are 

 specified, as well as the destination windows 

 for the magnitude and phase plots.")
@pause(5)
@CR
@Pause(5)
@unpop("p1")
@CR
moveto(w3)@cr
scales(2)@cr
@f6
@cr
zoom@cr
@pause(5)
unzoom@cr
@esc
moveto(w4)@cr
scales(2)@cr
@f6
@cr
zoom@cr
@pause(5)
unzoom@cr
@esc
@pop("p1",-1,-1,
" Let's examine the characteristic parameters for the 

 system: Peak Magnitude and Frequency, Bandwidth, 

 Crossover Frequency and Phase Margin.")
@pause(8)
@unpop("p1")
cc@cr
@pause(2)
F @CR
@pause(2)
F @CR
@pause(3)
@CR
DMF("dfstats.men") @CR
@pause(5)
@esc
@pause(1)
@pop("p7", -1, -1, " Next, we examine a Root Locus Plot. ") 
@pause(5)
@unpop("p7")

moveto(w5)@cr
Gline(4,1,1,0.5)@cr
Label("Controller Gains")@cr
Moveto(w6)@cr
Cc@cr
@pause(2)
P @CR
@pause(2)
R @CR
@pause(3)
@cr
@F6
scales(2) @CR
@cr
zoom@cr
@pause(3)
@pop("p1",-1,1,
" The Open-loop Pole locations are triangles, 

 the Zero locations are circles, and the 

 Closed-Loop Pole locations are Xs. ")
@pause(10)
@unpop("p1")
@pause(4)
@esc
@pop("p1",-1,-1,
"
  There are many more functions available in DADiSP/Controls.  

  To explore the menus, type 'CC' at the command line.
")
@pause(10)
@unpop("p1")
@pop("p1",-1,-1,
"
  With DADiSP/2002 and the Controls module, it is easy to design,

  analyze, and simulate LTI single-input/single output controllers 

  in one menu driven interactive software package.
")
@pause(12) @unpop("p1")
defmacro("MoreInfoDSPFile","MoreCtrl.dsp",2) @CR
defmacro("DemoTopic","DADiSP/Controls",2) @CR
dmf("MoreInfo.men") @CR


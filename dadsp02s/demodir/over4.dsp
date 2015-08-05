@pause(2)

removewin(-1) @cr

Loadworksheet("NINEWIN") @CR @pause(2)

@pop("pop2",-1,-1,
"
  DADiSP offers a tremendous range of capabilities...  
")

@pause(8) @unpop("pop2") 
@pop("pop1",5,2,
"  Data Acquisition and Input
                              ")
@pause(1)
@pop("pop2",10,4,
"      Technical Graphics
                              ")
@pause(1)
@pop("pop2a",15,6,
"        Data Analysis
                              ")
@pause(1)
@pop("pop3",20,8,
"  Digital Signal Processing
                              ")
@pause(1)
@pop("pop4",25,10,
"    Laboratory Automation
                              ")
@pause(1)
@pop("pop5",30,12,
"     Test & Measurement
                              ")
@pause(1)
@pop("pop5a",35,14,
"     Image Processing
                              ")
@pause(1)
@pop("pop6",40,16,
"     Matrix Manipulation
                              ")
@pause(1)
@pop("pop6a",45,18,
"   And more!  ")

@pause(4)
@unpop("pop6a") @unpop("pop6")  @unpop("pop5a")
@unpop("pop5")  @unpop("pop4")  @unpop("pop3")
@unpop("pop2a") @unpop("pop2")  @unpop("pop1")

@pop("pop1",1,2,
"         FOR . . .
                              ")

@pause(1)
@pop("pop2",5,4,
"        Engineering
                              ")
@pause(1)
@pop("pop2a",10,6,
"        Science 
                              ")
@pause(1)
@pop("pop3",15,8,
"      Medical Research 
                              ")
@pause(1)
@pop("pop4",20,10,
"     Industrial Research 
                              ")
@pause(1)
@pop("pop5",25,12,
"       Manufacturing
                              ")
@pause(1)
@pop("pop6",35,16,
"And a variety of other applications.")
@pause(4)
@unpop("pop6")  @unpop("pop5")  
@unpop("pop4")  @unpop("pop3")  @unpop("pop2a") 
@unpop("pop2")  @unpop("pop1") @pause(2)
@pop("pop1",-1,-1,
"  With DADiSP, you can work with data series

          - Over Time (like digital data)

          - As Tables or Matrices 

          - As XY Plots, Scatter Plots or Histograms

          - As 3-Dimensional, Waterfall, or Contour Plots  

          - As 4-Dimensional Shaded Surfaces
                                                              ")
@pause(10) 
@unpop("pop1") 
@pop("pop1",-1,-1,
"  DADiSP offers you many different VIEWS of your data.  

             - Line Graphs

             - Symbol Plots
 
             - Event (Pulse) Plots

             - Bar Graphs

             - Matrices and Tables

             and a variety of 3-D graphical views.
")
@pause(10) @unpop("pop1")
@pop("pop1",-1,1,
"
   And best of all, DADiSP

       - requires no programming  

       - is menu-driven

       - and is easy to use.
")
@pause(8) @unpop("pop1")

@pause(1)


@pop("pop1",-1,-1,
"
  DADiSP's flexible Worksheet Windows give you simultaneous  

  access to all of the analysis and graphics functions.
")
@pause(8) @unpop("pop1")

@pop("pop1",-1,15,
"
  There are hundreds of functions in DADiSP for your application. 

  DADiSP allows up to 100 Windows in a Worksheet for your analysis. 
")
@pause(8) @unpop("pop1")

@pop("p1",-1,5,
"
  DADiSP's Reference and User Guides are On-Line and at your fingertips.

")
@pause(8)
@pop("p2",-1,12,
"
  Use them to search for specific functions and topics, or  

  Cut and Paste examples directly into a Worksheet.
")
@pause(8)
@unpop("p2") @unpop("p1")

Loadworksheet("EDITDATA") @pause(1) @CR
@pause(1) 

@pop("pop1",-1,20,
"  Here is an example of a DADiSP Worksheet used for Data Reduction.  ")
@pause(5) @unpop("pop1")
@pause(8)

Loadworksheet("MATH") @pause(1) @CR
@pause(1) 
@pop("pop1",-1,20,
"  Here is a DADiSP Worksheet used for Mathematical Analysis.  ")
@pause(5) @unpop("pop1")
@pause(8)


Loadworksheet("SIGNAL") @pause(1) @CR
@pop("pop1",-1,20,
"  Here is an example of a DADiSP Worksheet used for Signal Processing.  ")
@pause(5) @unpop("pop1")

@pop("pop1",-1,-1,
"
  This Worksheet contains no data.  It is a Worksheet Template.

  This Template demonstrates DADiSP's most exceptional feature:

  Each Window contains a formula, or calculation.

  When new data is loaded into a DADiSP Window, ALL dependent Windows

  automatically recalculate and update graphically.

          Watch as a data series is loaded into W1. . .
")
@pause(20) @unpop("pop1") @pause(2)
loadseries("SPEECH.1.CHICKEN_LITTLE",1);label("Vibration Data") @CR
@pause(7)
@pop("pop1",-1,20,
"  ANY dataset could be loaded in this Worksheet.  ")
@pause(8)  @unpop("pop1")
@pop("pop1",-1,20,
"  ANY Worksheet can be saved with OR without data.  ")
@pause(8) @unpop("pop1")

@pause(5)
@ESC

Loadseries("Vibration.1.RSensor",1) @CR 

@pop("pop1",-1,18,
"
  A Worksheet Template allows you to perform the same analysis on ANY data.  
")
@pause(7)  @unpop("pop1")

Loadworksheet("VIBRATION_STUDY") @pause(2) @CR
@pop("pop1",-1,20,
"  Here is an example of a DADiSP Worksheet used for Vibration Analysis.  ")
@pause(5) @unpop("pop1") 
@pause(8)

newworksheet(0, 0) @CR
Loadworksheet("CURVE_FAMILY") @pause(2) @CR
@pop("pop1",-1,20,
"  Here is an example of a DADiSP Worksheet used for Technical Graphics.  ")
@pause(5) @unpop("pop1") 
@pause(8)

newworksheet(0, 0) @CR
Loadworksheet("STATS") @pause(1) @CR 
@pop("pop1",-1,20,
"  Here is an example of a DADiSP Worksheet used for Statistics.  ")
@pause(5) @unpop("pop1")
@pause(10)
 
@pop("pop1",-1,-1,
"
  That's just a subset of the many graphic and data analysis  

  functions that are available in the DADiSP Worksheet.
") 
@pause(7) @unpop("pop1")

@pop("p1",-1,-1,
"
   Explore the functions in the pull-down menus and Menu Map under   

   DATA, ANALYSIS, and VIEW during an interactive DADiSP session.   
")
@pause(10)
@unpop("p1")
@pop("pop1",-1,1,
"
  DADiSP is designed to adapt to your working environment...  
")
@pause(6)


!EDIT THIS SECTION FOR APPROPRIATE PLATFORMS IF NECESSARY

@pop("pop2",-1,5,
"
  DADiSP/2002 is available for Windows 9x/2000/NT/XP.  
")

@pause(15) @unpop("pop2") @pause(1)
@pop("pop2",-1,5,
"
  DADiSP provides special facilities for:

      -  Running your own programs from DADiSP

      -  Interacting with other programs via DDE and ActiveX

      -  Performing advanced Statistical or Signal Processing 
         functions

      -  Designing and using FIR and IIR filters, through menus  

      -  Interfacing to 1000s of IEEE-based instruments via 
         menu-driven instrument control panels
")
@pause(18)

@unpop("pop2") 
@pause(1)

@pause(2)@pop("pop2",-1,5,
"
  If your application requires customization, you can

  create your own functions, pop-up menus, and toolbar

  buttons for your favorite and frequently used tasks.
")
@pause(10)

@unpop("pop2")


@pop("pop3",-1,-1,
"
  You can create your own functions, macros, and command files  

        to automate routine tasks and free-up your time.
")
@pause(8)@unpop("pop3")@pause(1)
@unpop("pop1")

@pause(6) 
dmf("demomenu.men") @CR


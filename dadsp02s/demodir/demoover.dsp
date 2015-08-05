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
! Is there a limit to the number of boxes possible? It wont do "And More"!
!@pause(1)
!@pop("pop6a",45,18,
!"   And more!  ")
!@unpop("pop6a")
@pause(4) @unpop("pop6")  @pause(1) @unpop("pop5a") @pause(1) @unpop("pop5") @pause(1)
@unpop("pop4")  @pause(1) @unpop("pop3")  @pause(1) @unpop("pop2a") @pause(1)
@unpop("pop2")  @pause(1) @unpop("pop1") 
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
"       Component Design
                              ")
@pause(1)
@pop("pop5a",30,14,
"       Manufacturing
                              ")
@pause(1)
@pop("pop6",40,16,
"And a variety of other applications.")
@pause(4)
@unpop("pop6")  @unpop("pop5a")  @unpop("pop5") 
@unpop("pop4")  @unpop("pop3")  @unpop("pop2a") 
@unpop("pop2")  @unpop("pop1") @pause(2)
@pop("pop1",-1,-1,
"  With DADiSP, you can work with data series

          1. Over Time (like digital data),

          2. As Tables or Matrices, 

          3. As XY, Scatter Plots or Histograms,

          4. As 3-Dimensional, Waterfall, or Contour Plots,  

          5. As 4-Dimensional Shaded Surfaces
                                                              ")
@pause(8) 
@unpop("pop1") 
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
@pop("pop1",-1,1,
"
   And best of all, DADiSP

       - requires no programming  

       - is menu-driven

       - and is easy-to-use.
")
@pause(8) @unpop("pop1")
@pop("pop1",-1,-1,
"
  DADiSP's flexible Worksheet Windows give you simultaneous  

  access to all of the analysis and graphics functions.
")
@pause(5) @unpop("pop1")
removewin(-1) @cr
@ESC
!R @pause(2) 1 @CR @pause(1)
L NINEWIN @CR @pause(10)
@pop("pop1",-1,20,
"
  There are hundreds of functions in DADiSP for your application.  
")
@pause(5) @unpop("pop1")
@pop("pop1",-1,-1,
"
  Data Reduction includes:

  Data Input and Output
  Sorting
  Ranking
  Table Editing and Manipulation  
  Merging and Subsetting
") @pause(5) @unpop("pop1")
!@CNTL_HOME
!@ESC
!R @pause(2) 1 @CR @pause(1)
L EDITDATA @pause(3) @CR
@pause(1) 
@pop("pop1",-1,20,
"  Here is an example of a DADiSP Worksheet used for Data Reduction.  ")
@pause(5) @unpop("pop1")
@pause(10)
@pop("pop1",-1,-1,
"
  Mathematical Transformations include:  

      Integral 
      Derivative
      Moving Average
      Partial Sum
      Complex Numbers
      Logarithms
") @pause(7) @unpop("pop1")
L MATH @pause(3) @CR
@pause(1) 
@pop("pop1",-1,20,
"  Here is an example of a DADiSP Worksheet used for Math Transforms.  ")
@pause(5) @unpop("pop1")
@pause(10)
@pop("pop1",-1,-1,
"
  Signal Processing includes  

      Complex Math
      FFTs
      Filter Design
      Convolution
") @pause(7) @unpop("pop1")
L SIGNAL @pause(3) @CR
@pop("pop1",-1,20,
"  Here is an example of a DADiSP Worksheet used for Signal Processing.  ")
@pause(5) @unpop("pop1")
@pop("pop1",-1,-1,
"
                This Worksheet contains no data.

  This 'empty' Worksheet demonstrates DADiSP's most exceptional feature:

      Each Window contains a formula, or calculation.

      When new data is loaded into a DADiSP Window,

      ALL dependent Windows automatically recalculate and update graphically.

                             Watch . . .
")
@pause(15) @unpop("pop1")
E @F8 @pause(3) SPEECH.1 @CR @pause(3) @CR
@pause(7)
@pop("pop1",-1,20,
"  ANY dataset could be loaded in this Worksheet.  ")
@pause(7)  @unpop("pop1")
@pop("pop1",-1,20,
"  ANY Worksheet can be saved with OR without data.  ")
@pause(7) @unpop("pop1")

@pause(5)
@ESC
@pop("pop1",-1,-1,
"
  Graphical Manipulation includes:  

      Time-series plots
      XY and Symbol plots
      Contour Plots
      3D Surfaces
      4D Shading
") @pause(7) @unpop("pop1")
L Y QCPLOT @pause(3) @CR
@pop("pop1",-1,20,
"  Here is an example of a DADiSP Worksheet used for Technical Graphics.  ")
@pause(5) @unpop("pop1") 
@pause(10)
@pop("pop1",-1,-1,
"
  Statistics and Curve Fitting Includes:  

      Column Statistics
      Error Bars and Box Plots
      Linear Regression
      Polynomial Fits
      Spline Fits
      Residuals Plotting
")  @pause(7) @unpop("pop1")
L STATS @pause(2) @CR 
@pop("pop1",-1,20,
"  Here is an example of a DADiSP Worksheet used for Statistics.  ")
@pause(5) @unpop("pop1")
@pause(10)
@pause(1) 
@pop("pop1",-1,-1,
"
  Matrix Manipulation includes:  

      Inner Product
      Outer Product
      Matrix Inversion
      Eigenvalues and Eigenvectors  
      Determinants
      Upper and Lower Triangles
")  @pause(7) @unpop("pop1")
L SURFACE @pause(3) @CR
@pause(1) 
@pop("pop1",-1,20,
"  Here is an example of a DADiSP Worksheet used for Matrix Manipulation.")
@pause(5) @unpop("pop1")
E @pause(2) SURFACE @pause(2) @CR
@pause(10) @CNTL_HOME @RT @ESC
R @pause(1) 3 @pause(2) @CR E
@pop("pop1",-1,-1,
"
  That's just a subset of the many graphic and data analysis  

  functions that are available in the DADiSP Worksheet.
") 
@pause(7) @unpop("pop1")

@pop("pop1",-1,1,
"
  DADiSP is designed to adapt to your working environment...  
")
@pause(5)
@pop("pop2",-1,5,
"
  DADiSP is available on a variety of hardware platforms:  

             - Sun,
               Hewlett Packard,
               IBM,
               Digital Equipment  (ALPHA, VMS & Ultrix),
               Silicon Graphics,
               and Concurrent workstations, on top of X-Windows  

             - on IBM PCs and compatibles

             - and on the NeXT computer    
")
@pause(8) @unpop("pop2") @pause(1)
@pop("pop2",-1,5,
"
  DADiSP provides special facilities for:

      -  Running your own programs from DADiSP.
      
      -  Designing and creating FIR and IIR filters, thru menus  

      -  Interfacing to 1000s of IEEE-based instruments via 
         menu-driven instrument control panels

      -  Performing high-speed data acquisition from A/D boards.     
")
@pause(8)

@unpop("pop2") @pause(1) @unpop("pop1")
@pause(5)
@pop("pop3",-1,12,
"
  For example, if you have data acquisition routines or custom  

      data analysis programs, DADiSP can run these programs.
")
@pause(6) @unpop("pop3") 
@pause(2)@pop("pop2",-1,5,
"
  If your application requires customization,

  with DADiSP you can even create your own POP-UP MENUS.  
")
@pause(6)
@pop("pop3",-1,13,
"
  You can create your own functions, macros, and command files  

        to automate routine tasks and free-up your time.
")
@pause(8)@unpop("pop3")@pause(1)@unpop("pop2")
@pop("pop1",-1,4,
"
  You can pause, speed-up or stop this demo at any time

      To speed up the demo, press the SPACE BAR.

      To interrupt the demo, click the STOP button.  
")
@pause(12) @unpop("pop1")

demo @CR
@DN
@SUSPEND("@CR @ESC")
@RETURN

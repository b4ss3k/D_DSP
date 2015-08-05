removewin(-1) @cr
addwin(1) @cr
echo("The DADiSP Worksheet") @cr

@pop("pop2a",-1,12,
"
  WORKSHEETS are where you graph, view, analyze, acquire and input data.  

       WORKSHEETS can do the work of powerful data analysis programs.

  WORKSHEETS can also be used to store raw or derived data. 
") 


@pop("pop1",-1,5,
"
  To make this WORKSHEET, we added 1 WINDOW.  
")
@pause(10)

@pop("pop2",-1,11,
"
  You can add as many windows as you need to perform your analysis.  
")
@pause(3)
@unpop("pop2") @unpop("pop1") @unpop("pop2a")
poff @CR



! CHANGE THIS NEXT LINE FOR 4.0   
addwin(15) @cr 
@pause(3)




@pop("pop1",-1,20,
"     Here's a worksheet with 16 windows.     ")

@pause(5) @unpop("pop1")




! CHANGE THIS NEXT LINE FOR 4.0          
addwin(33) @cr
@pause(3)




@pop("pop1",-1,11,
"
  . . . and another Worksheet with more windows.  
")
@pause(3)
@unpop("pop1") 
@pause(3)

@pop("pop1",-1,-1,
"
  Maybe that's a few too many . . .  
")
@pause(5)
@unpop("pop1")



! CHANGE THIS NEXT LINE FOR 4.0    
removewindow(45) @cr 




moveto(w1) @cr
@pop("pop1",-1,-1,
"  
  Now we have a 4-Window Worksheet or template for analysis and graphing.  

  Here are some examples of graphs you can create in a DADiSP Worksheet.
")
@pause(8) @unpop("pop1")
pon @CR
waterfall(deriv(deriv(sombrero(-10,10,0.5))));scalesoff @CR  @pause(3)
@RT



! MAYBE IF WE GET THE MENUS WORKING DO ALL THIS THROUGH THE MENUS
Contour(w1) @CR
@pause(3)
@rt
density(w1) @CR
@rt
@pause(3)
w1 | Tableview | Label("Matrix View") @CR




@pause(3)
@CNTL_HOME
@rt @CR @F10 @pause(3) @f10 @ESC
@rt @CR @F10 @pause(3) @f10 @ESC
@rt @CR @F10 @pause(3) @f10 @ESC
@CNTL_HOME
@pop("pop2",-1,7,
"     There are many ways to get data into our Worksheet:    ")
@pause(4)
@pop("pop3",-1,10,
"    1.  Load data from a DADiSP DATASET")
@pause(3)
@pop("pop4",-1,12,
"    2.  Load data from any disk file (ASCII, Binary, etc.)  ")
@pause(3)
@pop("pop4a",-1,14,
"    3.  Get data from an instrument (e.g. oscilloscope) or A/D board  ")
@pause(3)
@pop("pop5",-1,16,
"    4.  Enter data manually, directly into a window,             ")
@pause(3)
@pop("pop6",-1,18,
"    5.  Generate data using DADiSP functions and formulas.")
@pause(10)
@unpop("pop6") @unpop("pop5") @unpop("pop4a")
@unpop("pop4") @unpop("pop3") @unpop("pop2") 
@pause(5)
@pop("pop1",-1,-1,
"
                DADiSP can LOAD and SAVE these Worksheets.

  Worksheets can be created, modified, and applied to new tasks quite easily. 

       DADiSP is ideal for experimenting with `what if' analysis chains.
")
@pause(9) @unpop("pop1")
@pop("pop1",-1,-1,
"
  Here is an example of a Worksheet used as an analysis template...  
")
@pause(4) @unpop("pop1")
@ESC




! CHANGE THIS NEXT LINE FOR 4.0    
Loadworksheet("FANCY") @pause(2) @cr 




@pop("mes", -1,-1,"We conduct our analysis by LOADing a Series into W1.") @pause(5)
@unpop("mes")
@CNTL_HOME 



! CHANGE THIS NEXT LINE FOR 4.0    
loadseries("TENSILE.1.STRAIN_RATE") @pause(2) @CR @pause(8)
@CNTL_HOME @RT @ESC 
Removewindow(3) @CR 
@pause(3)




demo @CR
@dn @dn
@SUSPEND("@CR @ESC")
@RETURN

@pause(2)

! Custom.dsp
removewin(-1) @CR
loadworksheet("MATH") @CR
@pop("p1",-1,-1,
"
   You can customize DADiSP/2002 completely...   

   It's Easy!
")
@pause(6)
@unpop("p1")

@pop("p1",-1,-1,
"   Add Custom Buttons to the Toolbar...   ")
@pause(6)
@unpop("p1")
DMF("toolbar.dmn") @CR
@pause(5)
@CR
@pop("p1",-1,5,
"
  Now, a click on the new toolbar button

  will generate 100 points of random noise.  
")
@pause(6)
@unpop("p1")

@pop("p1",-1,-1,
"   Change the Worksheet Layout...   ")
@pause(6)
@unpop("p1")
_mf("layout.men") @CR
@DN @CR
1,1,2 @pause(3)
@CR
redrawall @CR

@pop("p1",-1,-1,
"   or...change the layout again...")
@pause(6)
@unpop("p1")
_mf("layout.men") @CR
@CR
1,2,1 @pause(3)
@CR
redrawall @CR
@pop("p1",-1,-1,
"   or...use the mouse to resize the Windows.   ")
@pause(5)
@unpop("p1")
@pop("p1",-1,-1,
"   You can even turn off some of DADiSP's screen elements...")
@pause(5)
@unpop("p1")
SCREENOPT(0,0,0,0,0) @CR
@pause(5)
@pop("p1",-1,-1,
"
  Window numbers, formulas, and borders can be removed  

  from the display as well as from printed reports.
")
@pause(8)
@unpop("p1")
Screenopt(1,1,1,1,1) @CR
@pop("p1",5,3,
"
  Create your own functions with DADiSP's new  

  Series Processing Language (SPL)...
")
@pause(4)


@pop("p2",11,7,
"
  SPL is a compact language for manipulating data  

  and performing actions within the DADiSP Worksheet  

  Environment.
")
@pause(8)
@unpop("p2")
@pop("p2",11,7,
"
 SPL Features       

      - Array References

      - Variable Assignments

      - Conditional & Iterative Control Flow 

      - Parameter Passing

      - C-like Statement Processing
")
@pause(12)
@unpop("p2")

@pop("p2",11,7,
"
 SPL Variables Can Be:

      - Integer, Real, Complex, String, Series, or Array 

      - Local to Functions

      - Global to a Session

      - 'Hot': with Dependencies & which Automatically Update 
")
@pause(12)
@unpop("p2")
@unpop("p1")

@pop("p1",5,3,
"
  Communicate with other programs through  

  ActiveX and Dynamic Data Exchange (DDE)...
")
@pause(4)


@pop("p2",11,7,
"
  ActiveX is a method of inter-process communication.  
")
@pause(6)
@unpop("p2")

@pop("p2",11,7,
"
  DADiSP/2002 can be used as both an ActiveX client 

  and an ActiveX server.  
")
@pause(6)
@unpop("p2")

@pop("p2",11,7,
"
  ActiveX in DADiSP provides the means to link multiple

  programs such as acquisition utilities, databases, 

  and custom analysis routines.  The data and commands

  can be passed back and forth through the ActiveX links.  
")
@pause(14)
@unpop("p2")
@unpop("p1")
@pop("p1",5,3,
"
  Create your own Menus and Dialog Boxes...  
")
@pause(4)

@pop("p3",11,7,
"
  DADiSP Menus and Dialog Boxes are ASCII  

  text files which you create.
")
@pause(8)
@unpop("p3")
@pop("p3",11,7,
"
  DADiSP Menus have unlimited access  

  to all DADiSP functions, SPL functions,  

  menus and command files.
")
@pause(8)
@unpop("p3")
@pop("p3",11,7,
"
  You can access custom menus from the  

  command line, another menu, or a  

  button on the toolbar.
")
@pause(8)
@unpop("p3")
@unpop("p1")

@pop("p1",5,3,
"
  Automate Processes with Custom Command Files...  
")
@pause(4)

@pop("p2",11,7,
"
  Command Files are ASCII text files  

  with commands and keystrokes, similar  

  to a DOS Batch File or UNIX script.  
")
@pause(8)
@unpop("p2")
@pop("p2",11,7,
"
  This demo is a DADiSP Command File.  
")
@pause(8)
@unpop("p2")
@unpop("p1")

@pop("p1",-1,-1,
"
  Create custom charts and graphs with DADiSP/2002...
")
@pause(8)
@unpop("p1")
removewin(-1) @CR
loadworksheet("CURVE_FAMILY") @CR
@pause(8)
@pop("p1",1,1,
"
  Multiple scales, annotation anywhere within  

  the Worksheet, and automatic Legends add to  

  attractive custom reports.  
")
@pause(8)
@unpop("p1")
@pause(5)

@pop("p1",-1,-1,
"
  Many functions are available to customize  

  the look and feel of individual Windows, 

  as well as the entire Worksheet.
")
@pause(8)
@unpop("p1")
@pop("p1",-1,-1,
"
  Simply use the pull-down menus under  

  VIEW, DRAWING, TOOLS, and WINDOW

  during an interactive session, or 

  in the DADiSP Menu Map.
")
@pause(10)
@unpop("p1")
dmf("demomenu.men") @CR

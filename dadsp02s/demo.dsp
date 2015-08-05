! demo.dsp - main DADiSP/2002 DEMO FILE
removewin(-1) @cr
@highlight_message("DADiSP - Data Analysis and Display")

eval(strescape(sprintf('popbox("pop1", -1, -1, " ", "Welcome to the DADiSP/2002 self-running demonstration", " ", "brought to you by %s. ", " ")', getconf("oem_name")))) @cr

@pause(6) @unpop("pop1")

@pop("pop1",-1,-1,
" 
  DADiSP stores data and graphs in Labbooks.  

  This demonstration performs analysis in the Demo4 Labbook.  
")
@pause(8) @unpop("pop1")


@pop("pop1",-1,-1,
"
   During the demo you will see a number of 

    graphical screens, called Worksheets.

      Demo4 contains many Worksheets. 

    Let's load a sample DADiSP Worksheet.
")
@pause(7) @unpop("pop1")

loadworksheet("1st_SURFACE") @CR
setwscursor(2)@CR
! load in demo macros
macread("demo.mac") @cr
@highlight_message("DADiSP/2002 - Data Analysis and Display")

! waterfall(deriv(deriv(sombrero(-10,10,1.0)))) | Label("Surface Plot") @CR 
@pause(3)
@pop("pop1",-1,4, 
"
        DADiSP/2002        
") 
@pause(4)
@pop("pop1a",-1,8, 
" 
     DADiSP (pronounced Day-Disp) is the

         ULTIMATE Engineering Spreadsheet 

    designed specifically for Scientists and Engineers.
")
@pause(12) @unpop("pop1a") @unpop("pop1")

@pop("pop1",-1,4,
"
     You can pause, speed-up or stop this demo at any time     

    To speed up the demo, click the mouse or press the SPACE BAR.

           To interrupt the demo, click the STOP button.
")
@pause(12) @unpop("pop1")
@pop("pop1",-1,-1, 
"
  This demonstration is occurring inside the actual DADiSP program.  

   You can try any of the DADiSP features after this demonstration 

              WITHOUT ANY TRAINING - Just use the menus.
")

@pause(10) @unpop("pop1")
@pop("pop1",-1,-1,
"
      Use this tutorial to:

         - Learn about DADiSP features,

         - Use the worksheets and data in the 'Demo4' Labbook,

         - Build your own worksheets,

         - Develop analysis chains for your application.
")
@pause(8) @unpop("pop1")
@pop("pop1",-1,-1,
"
   After each section of this demonstration, a demo menu

   will appear.  The demo menus have a number of choices   

   to help you learn about DADiSP.  To select a menu item:


    - move to the choice with the arrow keys, and press the OK button   

                                  or

    - double click on the choice with the mouse.
")

@pause(15) @unpop("pop1")
dmf("demomenu.men") @CR

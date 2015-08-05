@pause(2)

removewin(-1) @cr
setprec(2) @cr
setwscursor(1) @CR
@pop("p1",-1,-1,
"
  Let's take a closer look at DADiSP/STATS.  
")
@pause(5)
@unpop("p1")
@pop("p1",-1,-1,
"
   In the first part of the STATS Demo, we displayed statistical   

   information about the experimental results in a variety of

   charts:  the Boxplot, XChart, and RChart.
")
@pause(8) @unpop("p1")


@pop("p2",-1,10,
"
   Now we will use Multiple Regression to find the    

   relationship between a set of input variables (x table)   

   and a specified result vector or series (y).
")
@pause(12) @unpop("p2")

@pop("p1",-1,-1,
"
   In this example, we will use some data obtained from an Impact Test   

   Machine.  The independent input variables are the Fracture Energy 
     
   and Angle, and the dependent output variable is the calculated Moment.   
")
@pause(12) @unpop("p1")

@pop("p1",-1,-1,
"
   This Worksheet will use multiple regression techniques to   

   predict the Moment value, given Fracture Energy and Angle.   
")
@pause(8) @unpop("p1")

@pop("p1",-1,-1,
"
   First, let's create a sample input table   

   with the Fracture Energy and Angles.
")
@pause(8) @unpop("p1")
addwin(5) @cr
moveto(w1) @cr
ravel(gser(8,10,6,11,8,7,10,9,10,6,12,9),gser(57,59,49,62,51,50,55,48,52,42,61,57));tablev;label("Fracture Energy, Angle") @cr
Setcomment("N/m",1,1);Setcomment("Degrees",1,2) @CR 
@cr zoom @cr @pause(5) @esc 

@pop("p1",-1,-1,
"
   Window 2 will contain the sample output data for the Moments.
")
@pause(6) @unpop("p1")

moveto(w2) @cr
gser(64,71,53,67,55,58,77,57,56,51,76,68);tableview;label("Moment Values");setcomment("N/m",1,1) @cr 
@CR zoom @cr @pause(4) @esc 
@pop("p1",-1,-1,
"
   Now, we create a multiple regression graph which maps

   the input data (Fracture Energy & Angle) to the output

   data (Moments).
")
@pause(7) @unpop("p1")

moveto(w3) @cr
dmf("stats1.dmn") @cr @pause(1)
@dn @dn @dn @dn @dn @dn @dn @dn @dn @dn @dn @dn @cr
@pause(1) @dn @dn @cr @pause(1) @cr
@pop("p1",-1,-1,
"
   Change the graph's display by adding symbols, 

   setting colors, and labeling the window.   
")
@pause(7) @unpop("p1")
setsymbol(square,1);label('Multiple Regression Graph');griddot;sercolor(lred) @cr
@cr zoom @cr @pause(4) @esc
@pause(5)
@pop("p1",-1,-1,
"
   Now we can obtain the regression coefficients.  There is one

   coefficient for each variable in the input table and one   

   additional coefficient that accounts for the constant term.   
")
@pause(10) @unpop("p1")

moveto(w4) @cr
dmf("stats1.dmn") @cr 

@dn @dn @dn @dn @dn @dn @dn @dn @dn @dn @dn @dn @cr
@pause(1) @dn @cr @pause(1) @cr
tableview;label('Regression Coefficients') @cr 
@cr zoom @cr @pause(2) @esc
@pause(5)

@pop("p1",-1,-1,
"
   Finally, use the coefficients to determine a Moment value for   

   a given input value for both Fracture Energy and Angle.  


   We'll input an Angle of 54 degrees, and a Fracture Energy of   

   9 Newton/meter and see what Moment value is predicted by the   

   regression coefficients.
")
@pause(16) @unpop("p1")

moveto(w5) @cr
gser(getpt(w4,1)+(getpt(w4,2)*9)+(getpt(w4,3)*54));label("Angle 54, Energy 9");tableview @cr
setcomment(" ") @CR 
@cr zoom @cr @pause(3) 
@pop("p1",-1,-1,
"
   A Moment of approximately 63.36 is computed from the specified 

   Angle and Fracture Energy inputs.  Multiple regression can be   

   used to predict output values for any number of input parameters.
")
@pause(8) @unpop("p1")

@esc

@pop("p1",-1,-1,
"
   DADiSP/Stats is a powerful module which augments the statistical   

   capabilities of DADiSP.  To view the menus, type ST from the

   command line in a Worksheet during an interactive session.
")

@pause(10)
@unpop("p1")
@CNTL_HOME 
setprec(-1) @cr
dmf("demmodul.men") @CR

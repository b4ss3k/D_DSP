@pause(2)

@pop("p1",-1,-1,
"
  We have created a Worksheet to analyze January's climate data.  
")
@pause(6)
@unpop("p1")
@pop("pop1",-1,1,
"
  If we want to perform the same calculations on a different set of data,  

  we need only load it into the present Worksheet to see the results.
")
@pause(6)

@pop("pop2",-1,8,
"
  DADiSP automatically updates each dependent window when new data is loaded.  
")
@pause(8)
@unpop("pop2") @unpop("pop1")


@pop("pop1",-1,4,
"
  Let's watch what happens when we load in a new dataset containing  

  the same climate information for the month of July for comparison.  
")
@pause(7)
@unpop("pop1")

@pop("p1",-1,-1,
"
  Before loading July's data, let's save January's summary data.  
")
@pause(4)
@unpop("p1")

setprec(2) @cr
addwin(2) @CR
moveto(w7) @CR
W4;tablev @CR
protect("JAN. TEMPERATURE STATS") @CR
moveto(w8) @CR
w6;tablev @CR
protect("PRECIPITATION > 0.01 INCHES") @CR
@pop("p1",-1,-1,
"
  Window 7 contains January's High, Low and Average Temperatures.

  Window 8 contains the dates and amount of precipitation >=0.01 inches.  
")
@pause(6)
@unpop("p1")
@pop("p1",-1,-1,
"
  Now, load July's climate data into Window 1,  
 
  and watch the Worksheet recalculate.
")
@pause(6)
@unpop("p1")
moveto(w1) @CR
SETWFORM('loaddataset("JUL91_CLIMATE.1",1,1);scales(2);label("JULY CLIMATE DATA")');ADDWFORM(W3,"LABEL('Precipitation: JULY')");Label(w4,"JULY TEMPERATURE STATS");redrawall @CR

@pause(4) 
@pop("p1",-1,-1,
"  
  Now that the Worksheet has recalculated, we can  

  display only those windows of interest.
")
@pause(5)
@unpop("p1")
Display(w4,w6,w7,w8) @pause(2) @CR
@pop("p1",-1,1,
"
  Compare the High, Low, and Average Temps displayed in Windows 4 & 7.  
")
@pause(6)
@unpop("p1")

@pop("p1",-1,1,
"
  Wow.  It was hot in July...but not too cold in January...  
")
@pause(6)
@unpop("p1")

display(w6,w8);rowlayout(2) @CR
@pop("p1",-1,1,
"
  Compare the Precipitations displayed in Windows 6 & 8.  
")
@pause(6)
@unpop("p1")
@pause(6)
@pop("p1",-1,1,
"
  There wasn't much precipitation in either January or July.  
")
@pause(6)
@unpop("p1")
moveto(w6);bars @CR
moveto(w8);bars @CR
@pause(8)
moveto(w6);tablev @CR
moveto(w8);tablev @CR

displayall @CR
setprec(-1) @cr
@pause(6)
dmf("apptopic.men") @CR

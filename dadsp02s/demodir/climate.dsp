@pause(1)

removewin(-1) @cr

addwin(4) @cr 
@pop("p1",-1,4,
"                        REMEMBER:

  You can pause, speed-up or stop this demo at any time

      To speed up the demo, press the SPACE BAR.

      To interrupt the demo, press the STOP button.  
")
@pause(6) @unpop("p1")

setprec(8) @CR
@CNTL_HOME
@pop("pop1",-1,4,
"
  Let's load a Dataset which contains a variety of daily  

  climate data measurements we want to analyze.
")
@pause(8)
@unpop("pop1")

@CNTL_HOME
loaddataset("JAN91_CLIMATE.1",1,1);scales(2);label("JANUARY CLIMATE DATA") @CR
@pause(1) @CR
@F10
@pause(4)
@CNTL_HOME

@pop("pop1",-1,1,
"
  Window 1 contains one month of climatology data.  The daily  

  measurements include: max, min, and avg temperatures as

  well as the dew point, and snow and rain precipitation levels.  
")
@pause(12)
@unpop("pop1")
@pause(2)
@ESC
@pop("pop1",-1,1,
"
  Each of these 7 measurements is a series and occupies  

  one column of the table that we have formed in Window 1.  
")
@pause(6)
@unpop("pop1")

@pop("pop1",-1,-1,
"
  Working with multi-column data is not only easy,  

  but fast and intuitive with DADiSP's graphical display  

  and menu driven interface.
")
@pause(8)
@unpop("pop1")

@pop("pop1",-1,-1,
"
  The table can be viewed in a number of ways.  

  For example...
")
@pause(4)
@unpop("pop1")


@pop("pop1",-1,-1,
"
  We can view the data right in its window with TABLEVIEW...  
")
@pause(3)
@unpop("pop1")
Tableview(w1) @CR
@CNTL_HOME
scmt("MaxTmp",1);scmt("MinTmp",2) @CR
scmt("AvgTmp",3);scmt("DepNorm",4) @CR
scmt("DewPt",5);scmt("Rain",6);scmt("Snow",7)@CR


@F10
@pause(4)
@pop("p1",-1,1,
"
  Too many digits of precision?  How about 2 digits?  
")
@pause(4)
@unpop("p1")
setprec(2) @pause(2) @CR
PON @CR
@pause(3)
@PG_DN @pause(2) @PG_DN @pause(2) @CNTL_HOME
@pause(5)
LINES @CR
@pause(1)
@ESC


@pop("pop1",-1,-1,
"
  Or, we can view up to 6 columns of data this way...  
")
@pause(3)
@unpop("pop1")


Tables(col(curr,1),col(curr,2),col(curr,3),col(curr,4)) @CR
@pause(4)
@ESC


@pop("pop1",-1,-1,
"
  We can extract just the portion of the table representing  

  MAX, MIN, & AVG temperatures during the month of January.  
")
@pause(6)
@unpop("pop1")


@RT
region(w1,1,31,1,3);scales(2);label("MAX, MIN & AVG TEMPS") @CR
@F10
@pause(8)
@ESC


@pop("pop1",-1,4,
"
  If we want to look at just one series in the table,  

  we can extract only that series which interests us.  
")
@pause(6)
@unpop("pop1")


@RT
col(w1,6);scales(2);label("Precipitation: JANUARY");Bars @CR
@F10
@pause(8) @ESC

@pop("p1",-1,-1,
"
  The data in Window 1 contains the daily measurements for the  

  month of January.  Suppose we are interested in calculating  

  January's Highest, Lowest, and Average Temperatures.
")
@pause(8)

@unpop("p1")

@pop("pop2",-1,-1,
" 
  We can create a table of these statistics in Window 4 with one easy step.  
")
@pause(4)

@unpop("pop2")
moveto(w4) @CR
setprec(4) @CR
Transpose(gser(max(col(w2,1)),min(col(w2,2)),mean(col(w2,3)))) @CR
addwf(w4,'scmt("High",1);scmt("Low",2);scmt("Avg",3)') @CR
Label("JAN. TEMPERATURE STATS") @CR @CR
tableview @CR
@F10
@pause(8)
@ESC

@pop("pop1",-1,4,
" 
  Suppose we want to determine on which days the amount  

  of precipitation exceeded 0.01 inches.
")
@pause(6)
@unpop("pop1")


@pop("pop1",-1,4,
" 
  We can use a binary series to give us the results of the condition:

                   Daily Precipitation >= 0.01 inches    
")
@pause(8)
@unpop("pop1")


Addwin(2) @CR
@RT
Col(W1,6)>=0.01;sticks;scales(2);label("Precip levels >= 0.01 Inches") @CR
@F10
@pause(8)


@pop("pop1",-1,1,
"
  This series indicates that there were 11 days during

  which the precipitation levels exceeded 0.01 inches.  
")
@pause(8)
@unpop("pop1")

@pop("pop1",-1,4,
" 
  However, wouldn't it be nice to view the day and actual  

  amount of precipitation together in one easy-to-read table?  
")
@pause(4)
@unpop("pop1")

@ESC
@RT
XY(delete((xvals(W3)*W5),W5==0),delete((W3*W5),W5==0));sethunits("Daily") @CR
addwf(w6,'scmt("Inches",1);scmt("Day",2);tablev') @CR
addwf('Label("PRECIPITATION > 0.01 INCHES")');PON @CR
Label("PRECIPITATION > 0.01 INCHES") @CR
@F10 @pause(8)

@ESC
defmacro("moreinfodspfile","moreclim.dsp",2) @CR
defmacro("demotopic","climatology",2) @CR
setprec(-1) @CR
dmf("moreinfo.men") @CR


@pause(2)

removewin(-1) @CR
addwin(4) @CR
@pop("p1",-1,-1,"DADiSP/Stats")
@pause(4)
@unpop("p1")

!macread("demodir\demostat.mac") @cr
macread(strcat("demodir",pathchar,"demostat.mac")) @cr
echo("DADiSP/STATS") @cr @pause(2)

@pop("p1",-1,-1,
"
 This demo will introduce many of the Statistics
    
 applications and functions available in DADiSP/Stats. 
")
@pause(7)
@unpop("p1")
@pop("p1",-1,1,
"
 DADiSP/Stats: 
")
@pause(1)
@pop("p2",-1,5,
"
 Computes Statistical Measurements 
")
@pause(2)
@pop("p3",-1,9,
"
 Performs Hypothesis Testing on Sample Data 
")
@pause(2)
@pop("p4",-1,13,
"
 Displays Summary Reports and Statistical Graphics 
")
@pause(2)

@pop("p5",-1,17,
"
 Calculates Probability values based on Standard Deviations, 

 including ChiSquare, Normal, T - Test, and F probabilities. 
")
@pause(2)
@unpop("p5")
@unpop("p4")
@unpop("p3")
@unpop("p2")
@unpop("p1")

@pop("p1",-1,5,
"  Here is the main menu for DADiSP/Stats.  ")
@pause(4)
@unpop("p1")
st @CR
@pause(6)
@ESC
@pause(1)

@pop("pop1",-1,-1,
"
  Let's create a sample table with temperature
  
  recordings for 6 different experiments.
")
@pause(10) @unpop("pop1")

setprec(1) @cr
moveto(w1);tablev @cr 
@cr y

@F3 
EXP#1 @cr
87 @cr 93 @cr 100 @cr 81 @cr 96 @cr @cntl_home @rt 
@F3
EXP#2 @cr
65 @cr 88 @cr 75 @cr 93 @cr 72 @cr @pg_up @rt
@F3
EXP#3 @cr
94 @cr 102 @cr 90 @cr 88 @cr 74 @cr @pg_up @rt
@F3
EXP#4 @cr
82 @cr 98 @cr 78 @cr 86 @cr 66 @cr @pg_up @rt
@F3
EXP#5 @cr
87 @cr 81 @cr 73 @cr 97 @cr 88 @cr @pg_up @rt  
@F3
EXP#6 @cr
67 @cr 71 @cr 93 @cr 90 @cr 81 @cr @esc @pause(4)

@esc  

label(w1,"Temperature Recordings") @cr
@pause(3)

@pop("pop1",-1,16,
" 
  Let's use DADiSP/Stats to create a Boxplot chart of the 
  
  experimental data, and statistics such as mean, min, max

  and standard deviation of the temperature recordings.
")
@pause(8) @unpop("pop1")

@pop("pop1",-1,4,
" 
  First, find the mean, max, min, and standard deviation  
  
  of the temperature recordings for each experiment.
")
@pause(8) 
@unpop("pop1")

addwin(4) @cr
display(w2..w5);collayout(4) @cr
moveto(w2) @CR

dmf("tabstats.dmn") @cr
@pause(2) a @cr @pause(2) @cr
setwform("colmean(w1);tableview;label('Mean of Temperature Recordings For Each Experiment')") @CR 
@pause(2)

moveto(w3) @CR
dmf("tabstats.dmn") @cr
@pause(2) @dn @dn @dn @dn @cr @pause(2) @cr
setwform("colmax(w1);tableview;label('Max of Temperature Recordings For Each Experiment')") @CR
@pause(2)

moveto(w4) @CR
dmf("tabstats.dmn") @cr
@pause(2) @dn @dn @dn @cr @pause(2) @cr
setwform("colmin(w1);tableview;label('Min of Temperature Recordings For Each Experiment')") @CR
@pause(2)

moveto(w5) @CR
dmf("tabstats.dmn") @cr
@pause(2) @dn @cr @pause(2) @cr
setwform("colstdev(w1);tableview;label('Standard Deviation of Temperature Recordings For Each Experiment')") @CR
@pause(3)


@pop("pop1",-1,-1,
" 
  Next, use these statistics to create the Boxplot Chart.
")
@pause(5) @unpop("pop1") 

addwin(1) @cr
display(w6);rowlayout(1) @cr

moveto(w6) @cr
defmacro("t(x)","transpose(x)") @cr
st @CR
@cr
B @pause(1) @CR
@pause(4)
@CR
@pause(1)
! i put all of this into the BOXPLOT.DMN menufile. it looks better that way.
!errorbar(t(w2+w5),t(w3),t(w4),t(w2-w5),t(w2),1);setx(-0.5,5.5);setxtic(1);wincolor(white,black);gridhv;griddot;sethunits("Experiments");setvunits("Temp.");scales(2);
label("Boxplot of our Temperature Recordings for the 6 Experiments") @cr

@pause(3) 

@pop("pop1",-1,1,
"
 The Boxplot heights are defined by the min, max, mean & standard deviation. 
")
@pause(6) @unpop("pop1")
@pause(5)

@pop("pop1",-1,-1,
"
 DADiSP/Stats can also produce Quality Control charts. 
")
@pause(3)
@unpop("pop1")

@pop("pop1",-1,3,
"
 Let's create Mean and Range QC charts. 
")
@pause(4)

@pop("pop2",-1,10,
" 
 Each chart contains the subgroup mean values, the mean line 

 (center control line), and upper/lower control limit lines.
")
@pause(6) @unpop("pop2") @unpop("pop1")

addwin(2) @cr
display(w1,w7,w8);rowlayout(1,2) @cr

moveto(w7) @cr
dmf("plots1.dmn") @cr
@pause(2)  @dn @dn @dn @dn @dn @dn @dn @dn @dn @dn @dn @cr @pause(2) @cr
@pause(1)

!setwform("xchart(w1);wincolor(black,lcyan);setxtic(1);sethunits('Experiments');setvunits('Temp Means');scales(2);label('Mean QC Chart')") @cr @cr zoom @cr

!addwform("wincolor(black,lcyan);setxtic(1);sethunits('Experiments');setvunits('Temp Means');scales(2);label('Mean QC Chart')") @cr 
addwform("setxtic(1);sethunits('Experiments');setvunits('Temp Means');scales(2);label('Mean QC Chart')") @cr 
label("Mean QC Chart") @CR
@cr zoom @cr
@pause(1)
@pop("pop2",-1,1,
" 
  Mean QC Chart 
")
@pause(3) @unpop("pop2")
@pause(3) @esc 

moveto(w8) @cr
dmf("plots1.dmn") @cr
@pause(2) @dn @dn @dn @dn  @dn @dn @dn @dn @dn @dn @dn @dn @cr @pause(2) @cr
@pause(1)

! setwform("rchart(w1);wincolor(black,lcyan);setxtic(1);sethunits('Experiments');setvunits('Temp Ranges');scales(2);label('Range QC Chart')") @cr @cr zoom @cr
!addwform("wincolor(black,lcyan);setxtic(1);sethunits('Experiments');setvunits('Temp Ranges');scales(2);label('Range QC Chart')") @cr
addwform("setxtic(1);sethunits('Experiments');setvunits('Temp Ranges');scales(2);label('Range QC Chart')") @cr
label("Range QC Chart") @CR
@cr zoom @cr

@pause(1)
@pop("pop2",-1,1,
" 
  Range QC Chart
")
@pause(3) @unpop("pop2")
@pause(3) @esc
moveto(w1) @cr

@pop("pop1",-1,4,
" 
 Finally, let's perform an ANOVA (One-way Analysis of Variance) 

 Hypothesis test on the experimental temperature data table. 
")  
@pause(6) 

@pop("pop2",-1,10,
" 
  Analysis of variance compares the difference in variance between 
  
  the sample populations - the columns of the input table - to the data

  in aggregate, which reflects the normal or random variation.
")  
@pause(10) @unpop("pop2") @unpop("pop1")

@pop("pop1",-1,-1,
" 
 The following table will have all the information 
  
 for the ANOVA Hypothesis Test.
")  
@pause(6) @unpop("pop1")
setprec(2) @CR
dmf("stats1.dmn") @cr
@pause(2) @dn @dn @dn @dn @dn @dn @dn @dn @dn @dn @cr @pause(10) @cr

@pop("p1",-1,-1,
"
    With DADiSP/2002 and the Stats module it is easy to acquire and 

  statistically analyze your data in one interactive software package.
")
@pause(8) @unpop("p1")

@pop("p1",-1,-1,
"
 You can view the menus included with DADiSP/Stats  

 by typing ST at the command line in a Worksheet.
")
@pause(6) @unpop("p1")

setprec(-1) @cr
defmacro("MoreInfoDSPFile","morestat.dsp",2) @CR
defmacro("DemoTopic","DADiSP/STATS",2) @CR

dmf("moreinfo.men") @CR

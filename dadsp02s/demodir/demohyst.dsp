@pause(2)

removewin(-1) @CR
Addwin(4) @CR
moveto(w1) @CR
#define txt(x,y,s) textann(x,y,paper,lpurple,-1,1,s) @CR
#define _st1 "Strain" @CR
#define _st2 "Stress" @CR
echo("Stress / Strain Analysis") @CR
@pop("p1",-1,4,
"                        REMEMBER:

  You can pause, speed-up or stop this demo at any time

      To speed up the demo, press the SPACE BAR.

      To interrupt the demo, press the STOP button.
")
@pause(6) @unpop("p1")
@pop("p1",-1,-1,
"
   Stress-Strain curves or Hysteris Loops can be used as tools  

   to obtain design parameters for limiting stresses on engineering

   components and structures which are subjected to loading.
")
@pause(12)
@unpop("p1")
@pop("p1",-1,-1,
"
   Stress-Strain curves are also useful for documenting the response 

   of various materials under initial or repeated loading conditions. 
")
@pause(8)
@unpop("p1")

@pop("p1",-1,-1,
"
   Let's examine the characteristics of a Stress-Strain curve.   
")
@pause(5)
@unpop("p1")
@pop("p1",-1,-1,
"
   To create the Stess-Strain curve, load the   

   Stress and Strain data into W1 and W2.
")
@pause(6)
@unpop("p1")
loadseries(w1,"Tensile.1.Strain") @CR
loadseries(w2,"Tensile.1.Stress") @CR
@pause(6)
@pop("p1",-1,-1,
"
   The hysteresis loop -- the Stress-Strain curve--   

          is simply an XY Plot in DADiSP.
")
@pause(5)
@unpop("p1")
moveto(w3) @CR
XY(w1,w2) @CR
scales(2) @CR
@cr zoom @CR @pause(5)
@pop("p1",-1,1,
"
   Two characteristics of interest are the ranges   

   for Strain Amplitude and Stress Amplitude.
")
@pause(8)
@unpop("p1")
POFF @CR
setxy(-1,1,-105,105) @CR
Overpl(xy(gser(-0.62,-0.62),gser(-100,-75)),lred) @CR
Overpl(xy(gser(0.65,0.65),gser(-100,-75)),lred) @CR
overpl(xy(gser(-0.62,0.65),gser(-88,-88)),lred) @CR
PON @CR
@pop("p1",-1,1,
"
   The Strain Amplitude is the range of the X-values.   
")
@pause(5)
@pop("p2",-1,4,
"
   The range of X-values is simply the difference between   

   the maximum and the minimum values of Window 1.
")
@pause(8)
@unpop("p2") @unpop("p1")
POFF @CR
overpl(xy(gser(-0.80,-0.62),gser(-70,-70)),lred) @CR
overpl(xy(gser(-0.80,-0.62),gser(71,71)),lred) @CR
overpl(xy(gser(-0.71,-0.71),gser(-70,71)),lred) @CR
PON @CR
@pop("p2",-1,1,
"
   The Stress Amplitude is the range of the Y-values.   
")
@pause(5)
@pop("p1",-1,4,
"
   The range of Y-values is simply the difference between   

   the maximum and the minimum values of Window 2.
")
@pause(8)
@unpop("p1") @unpop("p2")
@ESC
moveto(w4) @CR
@pop("p1",-1,-1,
"
   Let's calculate the Strain and Stress Amplitudes.   
")
@pause(5)
@unpop("p1")
POFF @CR
gser(max(w1)+abs(min(w1)),max(w2)+abs(min(w2)));tableview;pon @cr
Label("Amplitude Ranges") @CR
@pause(5)
@pop("p1",5,5,
"
   Now that the ranges have been calculated, let's annotate   

   the plot in Window 3 with their range values.
")
@pause(6)
@unpop("p1")
moveto(w3) @CR
@cr zoom @CR
#define st1 strcat(_st1,' Amplitude: ',strnum(getpt(w4,1))) @CR
#define st2 strcat(_st2,' Amplitude: ',strnum(getpt(w4,2))) @CR
addwf("txt(-0.3,-100,st1)") @CR PON @CR
addwf("txt(-0.85,35,st2)") @CR PON @CR
@pause(8)
@ESC
defmacro("MoreInfoDSPFile","MoreHyst.dsp",2) @CR
defmacro("DemoTopic","Stress-Strain Curves",2) @CR
dmf("MoreInfo.men") @CR

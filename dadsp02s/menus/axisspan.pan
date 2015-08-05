! AxisSpan.pan
@f{_fg1}
@b{_bg1}
@h{hlp("axisspan.hlp")}
@panel

{if(_charttab, "Axis", strcat("Axis Attributes for W", strnum(getwnum)))}

 Focus             <= ##           >~focus(<{getfocus}>)~_foclist()
 X Scale:          <R x{5}         >~defmacro("_xlg","<{_getxaxistype}>",2)~<Linear><Log>
 Y Scale:          <R x{165} y{-1} >~defmacro("_ylg","<{_getyaxistype}>",2)~<Linear><Log>

 Left X Coord:     <               >~defmacro("_xl",<{getxl}>,1)~input(1,"Left Window Coordinate") 
 Top Y Coord:      <x{-1} y{-1}   >~defmacro("_yt",<{getyt}>,1)~input(1,"Top Window Coordinate")
 Right X Coord:    <               >~defmacro("_xr",<{getxr}>,1)~input(1,"Right Window Coordinate")
 Bottom Y Coord:   <x{-1} y{-1}    >~defmacro("_yb",<{getyb}>,1)~input(1,"Bottom Window Coordinate")
 % of X Span:      <               >~defmacro("_xpct",<{_xpct}>,1)~input(2,"Percent of Full Span","Enter value between 1 & 100","",1,100)
 % of Y Span:      <x{-1} y{-1}    >~defmacro("_ypct",<{_ypct}>,1)~input(2,"Percent of Full Span","Enter value between 1 & 100","",1,100)

<L>
 X Tic Interval:   <*              >~defmacro("_xtc",_fromautotic('<>'),1)~_ticautolist(getxticset, getxtic) 
 Y Tic Interval:   <* x{-1} y{-1}  >~defmacro("_ytc",_fromautotic('<>'),1)~_ticautolist(getyticset, getytic) 
<L>
 Scales Location <=                            >~defmacro("_axs",'<{_gaxstyl(caststring(getscales))}>',2)~strfile(_mh("scaleopt.txt")) 

{if(not(_charttab), "<L>")}

~_MC
~scales(_asty2si(_axs));if(_xpct<100,staggerx(0),staggerx(1));if(_ypct<100,staggery(0),staggery(1))
~pon
~setx(_xl,_xl+((_xr-_xl)*100/_xpct));spanx(_xl,_xr);sety(_yb,_yb+((_yt-_yb)*100/_ypct));spany(_yb,_yt)
~pon
~if(strcmp(_xlg,"Linear")==0,setxlog(0);setxtic(_xtc));if(strcmp(_xlg,"Log")==0,setxlog(1));if(strcmp(_ylg,"Linear")==0,setylog(0);setytic(_ytc));if(strcmp(_ylg,"Log")==0,setylog(1))


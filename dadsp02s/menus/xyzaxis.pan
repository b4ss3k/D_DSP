! xyzaxis.pan
@f{_fg1}
@b{_bg1}
@h{hlp("axisspan.hlp")}
@panel

{if(_intabbed, "Axis", strcat("Axis Attributes for W", strnum(getwnum)))}
<>
 Left X Coord:     <               >~defmacro("_xl",<{getxl}>,1)~input(1,"Left Window Coordinate") 
 Right X Coord:    <x{-1} y{-1}   >~defmacro("_xr",<{getxr}>,1)~input(1,"Right Window Coordinate")

 Top Y Coord:      <               >~defmacro("_yt",<{getyt}>,1)~input(1,"Top Window Coordinate")
 Bottom Y Coord:   < x{-1} y{-1}   >~defmacro("_yb",<{getyb}>,1)~input(1,"Bottom Window Coordinate")

 Top Z Coord:      <               >~defmacro("_zt",<{getzt}>,1)~input(1,"Top Window Coordinate")
 Bottom Z Coord:   < x{-1} y{-1}   >~defmacro("_zb",<{getzb}>,1)~input(1,"Bottom Window Coordinate")

<L>
 X Tic Interval:   <*              >~defmacro("_xtc",_fromdeftic('<>'),1)~_ticautolist(getxticset, getxtic) 
 Y Tic Interval:   <*              >~defmacro("_ytc",_fromdeftic('<>'),1)~_ticautolist(getyticset, getytic) 
 Z Tic Interval:   <*              >~defmacro("_ztc",_fromdeftic('<>'),1)~_ticautolist(getzticset, getztic) 
<L>

~setx(_xl,_xr);sety(_yb,_yt);setz(_zb,_zt);
~setxtic(_xtc);setytic(_ytc);setztic(_ztc)

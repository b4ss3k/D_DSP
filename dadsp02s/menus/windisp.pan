! Windisp.pan - Window Display Parameters
@f{_fg1}
@b{_bg1}
@y1
@panel
        {strcat("Axis Ranges for W", strnum(getwnum))}

 Left X Coord:     <               >~_DEFXLEFT(<{getxl}>)~_INREAL("Left Window Coordinate") 
 Right X Coord:    <               >~_DEFXRIGHT(<{getxr}>)~_INREAL("Right Window Coordinate")
 Top Y Coord:      <               >~_DEFYTOP(<{getyt}>)~_INREAL("Top Window Coordinate")
 Bottom Y Coord:   <               >~_DEFYBOTTOM(<{getyb}>)~_INREAL("Bottom Window Coordinate")

 X Axis Type:      <               >~defmacro("_XAXESTR","<{_getxaxestr}>",1)~echo("Enter X Axes Type") | _mf("axes.men") | defmacro("_xaxes", eval("_axes"), 1)
 Y Axis Type:      <               >~defmacro("_YAXESTR","<{_getyaxestr}>",1)~echo("Enter Y Axes Type") | _mf("axes.men") | defmacro("_yaxes", eval("_axes"), 1)
 X Tic Interval:   <               >~_DEFXTIC(<{getxtic}>)~_INREAL("X Tic Interval") 
 Y Tic Interval:   <               >~_DEFYTIC(<{getytic}>)~_INREAL("Y Tic Interval") 
~_MC;if(strcmp(_gridon,"OFF")==0,gridoff)
~setx(numstr((_xleft)), numstr((_xright)));sety(numstr((_ytop)),numstr((_ybottom)));setxlog(_xaxes);setylog(_yaxes);if(NOT(_xaxes),setxtic(numstr(_xtic)));if(NOT(_yaxes),setytic(numstr(_ytic)))

! WC.pan - panel to get window parameters
@f{_fg1}
@b{_bg1}
@panel
{strcat("Window Parameters for W", strnum(getwnum))}
________________________

 Xleft:    <          >~_DEFXLEFT(<{_getxl}>)~_INREAL("Left Window Coordinate") 
 Xright:   <          >~_DEFXRIGHT(<{_getxr}>)~_INREAL("Right Window Coordinate")
 Ytop:     <          >~_DEFYTOP(<{_getyt}>)~_INREAL("Top Window Coordinate")
 Ybottom:  <          >~_DEFYBOTTOM(<{_getyb}>)~_INREAL("Bottom Window Coordinate")

 Xtic:     <          >~_DEFXTIC(<{_getxtic}>)~_INREAL("X Tic Interval") 
 Ytic:     <          >~_DEFYTIC(<{_getytic}>)~_INREAL("Y Tic Interval") 

~_MC;setx(numstr((_xleft)), numstr((_xright)));sety(numstr((_ytop)),numstr((_ybottom)));setxtic(numstr(_xtic));setytic(numstr(_ytic))

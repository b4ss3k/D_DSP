! curgrid.pan - panel for cursor and grid control in a window
@panel
@x-1
@y-1
@b{_bg2}
@f{_fg2}
    {strcat("Grids and Scales for W", strnum(getwnum))}
________________________________

 Grids          [<           >]~_DEFGRIDON("<    >")~< ON >< OFF >
 Grid Style     [<           >]~_DEFGRIDSTYLE("<        >")~< GRIDSOL >< GRIDDASH >< GRIDDOT >
 Grid Direction [<           >]~_DEFGRIDDIR("<          >")~< GRIDV >< GRIDH >< GRIDHV >

 Scales ON/OFF  [<           >]~_DEFSCALESON("<           >")~< SCALESON >< SCALESOFF >
 X Axis          <           > ~defmacro("_XAXESTR","<{_getxaxestr}>",1)~echo("Enter X Axes Type") | _mf("axes.men") | defmacro("_xaxes", eval("_axes"), 1)
 Y Axis          <           > ~defmacro("_YAXESTR","<{_getyaxestr}>",1)~echo("Enter Y Axes Type") | _mf("axes.men") | defmacro("_yaxes", eval("_axes"), 1)
 Xtic:           <           >~_DEFXTIC(<{getxtic}>)~_INREAL("X Tic Interval") 
 Ytic:           <           >~_DEFYTIC(<{getytic}>)~_INREAL("Y Tic Interval") 

~_MC ; eval(_gridstyle) ; eval(_griddir) ; eval(_scaleson) ; if(strcmp(_gridon,"OFF")==0,"gridoff");setxlog(_xaxes);setylog(_yaxes);;setxtic(numstr(_xtic));setytic(numstr(_ytic))

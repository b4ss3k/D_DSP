! Axes.pan - Window axes type                 
@x43
@y0
@b{_bg3}
@f{_fg3}
@panel
     {strcat("Axes Type for W", strnum(getwnum))}
____________________________

 X Axis       :  <          >~defmacro("_XAXESTR","<{_getxaxestr}>",1)~echo("Enter X Axes Type") | _mf("axes.men") | defmacro("_xaxes", eval("_axes"), 1)

 Y Axis       :  <          >~defmacro("_YAXESTR","<{_getyaxestr}>",1)~echo("Enter Y Axes Type") | _mf("axes.men") | defmacro("_yaxes", eval("_axes"), 1)

~_MC;setxlog(_xaxes);setylog(_yaxes)

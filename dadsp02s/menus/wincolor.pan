! wincolor.pan
@f{_fg1}
@b{_bg1}
@panel

{if(_intabbed, "Window", sprintf("Default Colors for W%d", getwnum))}
{setvar("_replot", 0)}
<>
        Window Color: <= p n                   >~defmacro("_WCOLOR","<{(getwcolor)}>",1)~_choosesyscolor
Default Series Color: <= p n                   >~defmacro("_SCOLOR","<{(getwcolor(-1))}>",1)~_choosecolor
  Default Grid Color: <= p n                   >~defmacro("_GCOLOR","<{(getgridcolor)}>",1)~_choosecolor
<>
{if(not(_intabbed), "<L>")}

~_mc

~if(getwcolor(-1)  != _scolor, poff; sercolor(_scolor); _replot = 1)
~if(getwcolor()    != _wcolor, poff; wincolor(_wcolor); _replot = 1)
~if(getgridcolor() != _gcolor, poff; gridcolor(_gcolor); _replot = 1)

! if not in property sheet plot it now
~if(not(_intabbed) && _replot, plotmode(1, 2))

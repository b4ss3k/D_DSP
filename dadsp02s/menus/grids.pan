! grids.pan
@panel
@b{_bg2}
@f{_fg2}
@h~help("gridsol")

{if(_intabbed, "Grids", strcat("GRID Related Attributes for W", strnum(getwnum)))}
{setvar("_replot", 0)}

<>
 X Grid Style:      <R x{5}        n>~_DEFXGRIDSTYLE("<{_getgridstyle(getgridstyle(1))}>")~<OFF><Solid><Dashed><Dotted>
 Y Grid Style:      <R x{-1} y{-1} n>~_DEFYGRIDSTYLE("<{_getgridstyle(getgridstyle(2))}>")~<OFF><Solid><Dashed><Dotted>

<>
 Grid Color:   <= p n         >~defmacro("_GCOLOR","<{(getgridcolor)}>",1)~_choosecolor
{if(_intabbed, "<>", "<L>")}


~_MC; 

~if(eval("_xgridstyle") != getgridstyle(1), poff; setgridstyle(1, eval("_xgridstyle")); _replot = 1);
~if(eval("_ygridstyle") != getgridstyle(2), poff; setgridstyle(2, eval("_ygridstyle")); _replot = 1);

~if(_gcolor != getgridcolor, poff; gridcolor(_gcolor); _replot = 1)

! if not in property sheet plot it now
~if(not(_intabbed) && _replot, pon)

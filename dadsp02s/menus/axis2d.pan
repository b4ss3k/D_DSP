! axis2d.pan
@f{_fg1}
@b{_bg1}
@h{hlp("axisspan.hlp")}
@panel

{if(_intabbed, "Axis", strcat("Axis Attributes for W", strnum(getwnum)))}
{setvar("_replot", 0)}

<>

 Left X Coord:     <             % >~setvar("_xl",<{getxl}>)~input(1,"Left Window Coordinate") 
 Top Y Coord:      <x{-1} y{-1}  % >~setvar("_yt",<{getyt}>)~input(1,"Top Window Coordinate")
 Right X Coord:    <             % >~setvar("_xr",<{getxr}>)~input(1,"Right Window Coordinate")
 Bottom Y Coord:   <x{-1} y{-1}  % >~setvar("_yb",<{getyb}>)~input(1,"Bottom Window Coordinate")

<L>
 X Tic Interval:   <% w{15} e{_xticaut==0}                    >~setvar("_xtc", _fromauto("<{_toauto(_xtc)}>"))~input(1, 0)
 {_automaticstr}   <# c   x{-1} y{-1} w{1+strlen(_automaticstr)}>~setvar("_xticaut", <{_xticaut}>);if(_xticaut, setvar("_xtc", "-1"), if(_xtc=="-1", setvar("_xtc", caststring(getxtic))))~<0><1>
 Y Tic Interval:   <% w{15} e{_yticaut==0} x{-3} y{-1}        >~setvar("_ytc", _fromauto("<{_toauto(_ytc)}>"))~input(1, 0)
 {_automaticstr}   <# c   x{-1} y{-1} w{1+strlen(_automaticstr)}>~setvar("_yticaut", <{_yticaut}>);if(_yticaut, setvar("_ytc", "-1"), if(_ytc=="-1", setvar("_ytc", caststring(getytic))))~<0><1>
<L>
 Scales Location:  <=             % >~setvar("_axs",'<{_gaxstyl(caststring(getscales))}>')~_axlist 
Preserve Axis Settings <c x{-1} y{-1} %  >~setvar("_pscale", <{not(ascale())}>)~<0><1>
Autoscale <b # x{-1} y{-1}>~~poff;if(getscales != _asty2si(_axs), scales(_asty2si(_axs)));_setxtic(_xtc, _xticaut);_setytic(_ytc, _yticaut);if(ascale() != not(_pscale), ascale(not(_pscale)));autoscale(1);_initax;pon

{if(not(_intabbed), "<L>")}

~_MC

! scale location
~if (getscales != _asty2si(_axs), poff; scales(_asty2si(_axs)); _replot = 1)

! coords
~if((caststring(_xl) != caststring(getxl)) || (caststring(_xr) != caststring(getxr)), poff; setx(_xl,_xr); _replot = 1)
~if((caststring(_yb) != caststring(getyb)) || (caststring(_yt) != caststring(getyt)), poff; sety(_yb,_yt); _replot = 1)

! tics
~if(_xticaut, _xtcval = -1, _xtcval = castreal(_xtc))
~if(((not(_xticaut) && (_xtcval != getxtic)) || (getxticset == _xticaut)), poff;setxtic(_xtcval);_asty2si(_axs);setvar("_replot", 1));

~if(_yticaut, _ytcval = -1, _ytcval = castreal(_ytc))
~if(((not(_yticaut) && (_ytcval != getytic)) || (getyticset == _yticaut)), poff;setytic(_ytcval);_asty2si(_axs);setvar("_replot", 1));

! autoscaling
~if(ascale() != not(_pscale), ascale(not(_pscale)))

! if not in property sheet plot it now
~if(not(_intabbed) && _replot, pon)

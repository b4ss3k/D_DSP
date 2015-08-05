! axis3d.pan
@f{_fg1}
@b{_bg1}
@h{hlp("axisspan.hlp")}
@panel

{if(_intabbed, "Axis", strcat("Axis Attributes for W", strnum(getwnum)))}
{setvar("_xrot",getrotate3d(1));setvar("_yrot",getrotate3d(1));setvar("_zrot",getrotate3d(1));}
{setvar("_replot", 0)}

<>
 Left X Coord:     <             w{30} % >~setvar("_xl",<{getxl}>)~input(1,"Left Window Coordinate") 
 Right X Coord:    <x{-1} y{-1}  w{30} % >~setvar("_xr",<{getxr}>)~input(1,"Right Window Coordinate")

 Top Y Coord:      <             w{30} % >~setvar("_yt",<{getyt}>)~input(1,"Top Window Coordinate")
 Bottom Y Coord:   < x{-1} y{-1} w{30} % >~setvar("_yb",<{getyb}>)~input(1,"Bottom Window Coordinate")

 Top Z Coord:      <             w{30} % >~setvar("_zt",<{getzt}>)~input(1,"Top Window Coordinate")
 Bottom Z Coord:   < x{-1} y{-1} w{30} % >~setvar("_zb",<{getzb}>)~input(1,"Bottom Window Coordinate")

<L>
 X Tic Interval:   <% w{15} e{_xticaut==0}                    >~setvar("_xtc", _fromauto("<{_toauto(_xtc)}>"))~input(1, 0)
 {_automaticstr}   <# c   x{-1} y{-1} w{1+strlen(_automaticstr)}>~setvar("_xticaut", <{_xticaut}>);if(_xticaut, setvar("_xtc", "-1"), if(_xtc=="-1", setvar("_xtc", caststring(getxtic))))~<0><1>
     X Rotation:   <x{-3} y{-1} w{30}  % >~setvar("_xrot",<{getrotate3d(1)}>)~_INREAL("X") 
 Y Tic Interval:   <% w{15} e{_yticaut==0}                    >~setvar("_ytc", _fromauto("<{_toauto(_ytc)}>"))~input(1, 0)
 {_automaticstr}   <# c   x{-1} y{-1} w{1+strlen(_automaticstr)}>~setvar("_yticaut", <{_yticaut}>);if(_yticaut, setvar("_ytc", "-1"), if(_ytc=="-1", setvar("_ytc", caststring(getytic))))~<0><1>
     Y Rotation:   <x{-3} y{-1} w{30}  % >~setvar("_yrot",<{getrotate3d(2)}>)~_INREAL("Y") 
 Z Tic Interval:   <% w{15} e{_zticaut==0}                    >~setvar("_ztc", _fromauto("<{_toauto(_ztc)}>"))~input(1, 0)
 {_automaticstr}   <# c   x{-1} y{-1} w{1+strlen(_automaticstr)}>~setvar("_zticaut", <{_zticaut}>);if(_zticaut, setvar("_ztc", "-1"), if(_ytc=="-1", setvar("_ytc", caststring(getytic))))~<0><1>
     Z Rotation:   <x{-3} y{-1} w{30}  % >~setvar("_zrot",<{getrotate3d(3)}>)~_INREAL("Z") 
<L>
 Scales Location:  <=             %>~setvar("_axs",'<{_gax3dstyl(caststring(getscales))}>',2)~_axlist(1) 
"                      "<X{-1} y{-1}>
!Preserve Axis Settings <c x{-1} y{-1} %        >~setvar("_pscale", <{not(ascale())}>)~<0><1>
Autoscale <b # x{-1} y{-1}>~~poff;if(getscales != _as3d2i(_axs), scales(_as3d2i(_axs)));_setxtic(_xtc, _xticaut);_setytic(_ytc, _yticaut);_setztic(_ztc, _zticaut);if(ascale() != not(_pscale), ascale(not(_pscale)));autoscale(1);_initax3;pon

{if(not(_intabbed), "<L>")}

~if(getscales != _as3d2i(_axs), poff; scales(_as3d2i(_axs)); _replot = 1)

~if((caststring(_xl) != caststring(getxl)) || (caststring(_xr) != caststring(getxr)), poff; setx(_xl,_xr); _replot = 1)
~if((caststring(_yb) != caststring(getyb)) || (caststring(_yt) != caststring(getyt)), poff; sety(_yb,_yt); _replot = 1)
~if((caststring(_zb) != caststring(getzb)) || (caststring(_zt) != caststring(getzt)), poff; setz(_zb,_zt); _replot = 1)

! redo tics & log axis
~if(_xticaut, _xtcval = -1, _xtcval = castreal(_xtc))
~if(((not(_xticaut) && (_xtcval != getxtic)) || (getxticset == _xticaut)), poff;setxtic(_xtcval);setvar("_replot", 1));

~if(_yticaut, _ytcval = -1, _ytcval = castreal(_ytc))
~if(((not(_yticaut) && (_ytcval != getxtic)) || (getyticset == _yticaut)), poff;setytic(_ytcval);setvar("_replot", 1));

~if(_zticaut, _ztcval = -1, _ztcval = castreal(_ztc))
~if(((not(_zticaut) && (_ztcval != getxtic)) || (getzticset == _zticaut)), poff;setztic(_ztcval);setvar("_replot", 1));

~if(_xrot != getrotate3d(1) || _yrot != getrotate3d(2) || _zrot != getrotate3d(3), poff; rotate3d(_xrot, _yrot, _zrot); _replot = 1)

~if(ascale() != not(_pscale), ascale(not(_pscale)))

! if not in property sheet plot it now
~if(not(_intabbed) && _replot, pon)

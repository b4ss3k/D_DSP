! Axisfoc.pan
@f{_fg1}
@b{_bg1}
@h{hlp("axisspan.hlp")}
@panel


{if(_intabbed, "Axis", strcat("Axis Attributes for W", strnum(getwnum)))}
{setvar("_replot", 0)}


 Overlay Focus: <= ##           >~focus(<{getfocus}>);_initax~_foclist()
 Sync Axes: <n x{-1} y{-1}  >~sync(<{getsync}>)~<Independent><X><Y><XY><X Expand><Y Expand><XY Expand>
 <L>
 X Scale:          <R x{5}  y{35}    n # >~setvar("_xlg",<{_xlg}>)~<Linear><Log>
 Label X Subtics   <c x{-1} y{45} e{_xlg}  w{15} % >~setvar("_xlgls",<{_xlgls}>)~<0><1>
 Use 10^n Labels   <c x{-2}       e{_xlg}  w{15} % >~setvar("_xlgxt",<{_xlgxt}>)~<0><1>
 Y Scale:          <R x{-1} y{35} n # >~setvar("_ylg",<{_ylg}>)~<Linear><Log>
 Label Y Subtics   <c x{-1} y{45} e{_ylg}  % >~setvar("_ylgls",<{_ylgls}>)~<0><1>
 Use 10^n Labels   <c x{-2}       e{_ylg}  % >~setvar("_ylgxt",<{_ylgxt}>)~<0><1>

 Left X Coord:     <y{-2}       w{30}  % >~setvar("_xl",<{getxl}>)~input(1,"Left Window Coordinate") 
 Top Y Coord:      <x{-1} y{-1} w{30}  % >~setvar("_yt",<{getyt}>)~input(1,"Top Window Coordinate")
 Right X Coord:    <            w{30}  % >~setvar("_xr",<{getxr}>)~input(1,"Right Window Coordinate")
 Bottom Y Coord:   <x{-1} y{-1} w{30}  % >~setvar("_yb",<{getyb}>)~input(1,"Bottom Window Coordinate")
 % of X Span:      <            w{30}  % >~setvar("_xpct",<{_gspnxp}>)~input(2,"Percent of Full Span","Enter value between 1 & 100","",1,100)
 % of Y Span:      <x{-1} y{-1} w{30}  % >~setvar("_ypct",<{_gspnyp}>)~input(2,"Percent of Full Span","Enter value between 1 & 100","",1,100)

<L>
 X Tic Interval:   <% w{15} e{_xticaut==0}                     >~setvar("_xtc", _fromauto("<{_toauto(_xtc)}>"))~input(1, 0)
 {_automaticstr}   <# c  x{-1} y{-1} w{1+strlen(_automaticstr)}>~setvar("_xticaut", <{_xticaut}>);if(_xticaut, setvar("_xtc", "-1"), if(_xtc=="-1", setvar("_xtc", caststring(getxtic))))~<0><1>
 DummyText         <y{-1} v{0} e{0} w{30}>~~
 Y Tic Interval:   <% w{15} e{_yticaut==0} x{-1} y{-1}        >~setvar("_ytc", _fromauto("<{_toauto(_ytc)}>"))~input(1, 0)
 {_automaticstr}   <# c x{-1} y{-1} w{1+strlen(_automaticstr)}>~setvar("_yticaut", <{_yticaut}>);if(_yticaut, setvar("_ytc", "-1"), if(_ytc=="-1", setvar("_ytc", caststring(getytic))))~<0><1>
<L>
 Scales Location <= %                          >~setvar("_axs",'<{_axs}>')~_axlist
Preserve Axis Settings <c x{-1} y{-1} %        >~setvar("_pscale", <{_pscale}>)~<0><1>
Autoscale <b # x{-1} y{-1}>~~poff;setxlog(_xlg);setylog(_ylg);if(getscales != _asty2si(_axs), scales(_asty2si(_axs)));_setxtic(_xtc, _xticaut);_setytic(_ytc, _yticaut);if(ascale() != not(_pscale), ascale(not(_pscale)));autoscale(1);_initax;pon

{if(not(_intabbed), "<L>")}

~_MC

! redo scales
~if(getscales != _asty2si(_axs), poff;setvar("_replot", 1);scales(_asty2si(_axs)))

! redo log
~if((_xlg == 1) && (getxlog == 0), poff;setxlog(1);setvar("_replot", 1), if((_xlg == 0) && (getxlog == 1), poff;setxlog(0);setvar("_replot", 1)));
~if((_xlgls == 1) && (getxlog(1) == 0), poff;setxlog(-1,1);setvar("_replot", 1), if((_xlgls == 0) && (getxlog(1) == 1), poff;setxlog(-1,0);setvar("_replot", 1)));
~if((_xlgxt == 1) && (getxlog(2) == 0), poff;setxlog(-1,-1,1);setvar("_replot", 1), if((_xlgxt == 0) && (getxlog(2) == 1), poff;setxlog(-1,-1,0);setvar("_replot", 1)));

~if((_ylg == 1) && (getylog == 0), poff;setylog(1);setvar("_replot", 1), if((_ylg == 0) && (getylog == 1), poff;setylog(0);setvar("_replot", 1)));
~if((_ylgls == 1) && (getylog(1) == 0), poff;setylog(-1,1);setvar("_replot", 1), if((_ylgls == 0) && (getylog(1) == 1), poff;setylog(-1,0);setvar("_replot", 1)));
~if((_ylgxt == 1) && (getylog(2) == 0), poff;setylog(-1,-1,1);setvar("_replot", 1), if((_ylgxt == 0) && (getylog(2) == 1), poff;setylog(-1,-1,0);setvar("_replot", 1)));

! redo stagger
~if((_gspnxp != _xpct) || (_gspnyp != _ypct), if(_xpct<100,staggerx(0),staggerx(1));if(_ypct<100,staggery(0),staggery(1));pon)

! redo x range
~if((_gspnxp != _xpct) || (caststring(_xl) != caststring(getxl)) || (caststring(_xr) != caststring(getxr)), setx(_xl,_xl+((_xr-_xl)*100/_xpct));if(_xpct<100,spanx(_xl,_xr),spanx(0, 0));if(not(getxticset),setxtic(-1)));

! redo y range
~if((_gspnyp != _ypct) || (caststring(_yb) != caststring(getyb)) || (caststring(_yt) != caststring(getyt)), sety(_yb,_yb+((_yt-_yb)*100/_ypct));if(_ypct<100,spany(_yb,_yt),spany(0, 0));if(not(getyticset),setytic(-1)));

! redo tics & log axis
~if(_xticaut, _xtcval = -1, _xtcval = castreal(_xtc))
~if(((not(_xticaut) && (_xtcval != getxtic)) || (getxticset == _xticaut)) || (_xlg != _getxaxistype), poff;setxtic(_xtcval);setvar("_replot", 1));

~if(_yticaut, _ytcval = -1, _ytcval = castreal(_ytc))
~if(((not(_yticaut) && (_ytcval != getytic)) || (getyticset == _yticaut)) || (_ylg != _getyaxistype), poff;setytic(_ytcval);setvar("_replot", 1));

! autoscaling
~if(ascale() != not(_pscale), ascale(not(_pscale)))

! if not in property sheet plot it now
~if(not(_intabbed) && _replot, pon)





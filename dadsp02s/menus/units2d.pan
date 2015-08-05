! units2d.pan
@b{_bg2}
@f{_fg2}
@panel
{if(_intabbed, "Data Settings", strcat("Data Settings for W", strnum(getwnum)))}
{setvar("_dxdeltastr", caststring(_getdeltax(-1, -1)))}
{setvar("_dxoffstr",   caststring(_getxoffset(-1, -1)))}
{setvar("_dydeltastr", caststring(_getdeltay))}
{setvar("_dyoffstr",   caststring(_getyoffset))}

<>
 Horizontal Units (X):  <*                   >  ~_DEFDHUNITS("<{gethunits(-1,-1)}>") ~_unitslist
   Vertical Units (Y):  <*                   >  ~_DEFDVUNITS("<{getvunits(-1,-1)}>") ~_unitslist
     Height Units (Z):  <*                   >  ~_DEFDZUNITS("<{getzunits}>") ~_unitslist
<L>
          X Delta : <                    >  ~_DEFDXDELTA(<{_getdeltax(-1,-1)}>)~_INREAL("X Delta")
          X Offset: <                    >  ~_DEFDXOFFSET(<{_getxoffset(-1,-1)}>)~_INREAL("X Offset")
<L>
          Y Delta : <                    >  ~_DEFDYDELTA(<{_getdeltay}>)~_INREAL("Y Delta")
          Y Offset: <                    >  ~_DEFDYOFFSET(<{_getyoffset}>)~_INREAL("Y Offset")

{if(not(_intabbed), "<L>")}

~_MC

~if(length > 0, if(_dxdeltastr != caststring(_dxdelta), poff; setdeltax(_dxdelta); _replot = 1))
~if(length > 0, if(_dxoffstr   != caststring(_dxoff),   poff; setxoffset(_dxoff);  _replot = 1))
~if(length > 0, if(_dydeltastr != caststring(_dydelta), poff; setdeltay(_dydelta); _replot = 1))
~if(length > 0, if(_dyoffstr   != caststring(_dyoff)  , poff; setyoffset(_dyoff);  _replot = 1))

~if(_dvunits != getvunits, poff; _setvunits(_dvunits, 0,-1); _replot = 1)
~if(_dhunits != gethunits, poff; _sethunits(_dhunits,-1,-1); _replot = 1)
~if(_dzunits != getzunits, poff; _setzunits(_dzunits); _replot = 1)


! if not in property sheet plot it now
~if(not(_intabbed) && _replot, pon)


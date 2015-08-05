! SerData.pan
@b{_bg2}
@f{_fg2}
@panel
{if(_intabbed, "Data Settings", strcat("Data Settings for W", strnum(getwnum)))}
{setvar("_replot", 0)}
{defvar("_titem", 1);defvar("_tmember", 1)}
{setvar("_dxdeltastr", caststring(_getdeltax(_titem, _tmember)))}
{setvar("_dxoffstr",   caststring(_getxoffset(_titem, _tmember)))}

 Data Series: <= #        >  ~(_titem, _tmember) = _getitem(_lst2col(<{_itm2col(&_titem, &_tmember)}>)) ~_serlist 
<L>
   Vertical Units (Y): <*                   >  ~_DEFDVUNITS("<{_gvunits(_titem, _tmember)}>") ~_unitslist
 Horizontal Units (X): <*                   >  ~_DEFDHUNITS("<{_ghunits(_titem, _tmember)}>") ~_unitslist
<L>
          X Delta : < e{not(_isxy(_titem))} >  ~_DEFDXDELTA(<{_getdeltax(_titem, _tmember)}>)~_INREAL("X Delta")
          X Offset: < e{not(_isxy(_titem))} >  ~_DEFDXOFFSET(<{_getxoffset(_titem, _tmember)}>)~_INREAL("X Offset")

{if(not(_intabbed), "<L>")}

~_MC

~if(not(_isxy(_titem)) && (length > 0), if(_dxdeltastr != caststring(_dxdelta),  poff; setdeltax(_dxdelta, _titem, _tmember); _replot = 1))
~if(not(_isxy(_titem)) && (length > 0), if(_dxoffstr   != caststring(_dxoff),    poff; setxoffset(_dxoff, _titem, _tmember);  _replot = 1))

~if(_dvunits != _gvunits, poff; _setvunits(_dvunits, _titem, _tmember); _replot = 1)
~if(_dhunits != _ghunits, poff; _sethunits(_dhunits, _titem, _tmember); _replot = 1)

! if not in property sheet plot it now
~if(not(_intabbed) && _replot, pon)

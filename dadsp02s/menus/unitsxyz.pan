! unitsxyz.pan
@b{_bg2}
@f{_fg2}
@panel
{if(_intabbed, "Data Settings", strcat("Data Settings for W", strnum(getwnum)))}
<>
 Horizontal Units (X):  <*                   >  ~_DEFDHUNITS("<{gethunits(-1,-1)}>") ~_unitslist
   Vertical Units (Y):  <*                   >  ~_DEFDVUNITS("<{getvunits(-1,-1)}>") ~_unitslist
     Height Units (Z):  <*                   >  ~_DEFDZUNITS("<{getzunits}>") ~_unitslist

{if(not(_intabbed), "<L>")}

~if(_dvunits != getvunits, poff; _setvunits(_dvunits,-1,-1); _replot = 1)
~if(_dhunits != gethunits, poff; _sethunits(_dhunits,-1,-1); _replot = 1)
~if(_dzunits != getzunits, poff; _setzunits(_dzunits); _replot = 1)

! if not in property sheet plot it now
~if(not(_intabbed) && _replot, pon)


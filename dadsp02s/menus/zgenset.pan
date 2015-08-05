! genset.pan
@x0
@y0
@b{_bg2}
@f{_fg2}
@panel
Data Settings
{defvar("_fxycmap", 0)}
{defvar("_fxyptype", "Z Surface")}
<>
 X Units :  <*                   >  ~_DEFHUNITS("<{_hunits}>") ~_unitslist
 Y Units :  <*                   >  ~_DEFVUNITS("<{_vunits}>") ~_unitslist
 Z Units :  <*                   >  ~_DEFZUNITS("<{_zunits}>") ~_unitslist
 <L>
 Plot Type:       <=             >~setvar("_fxyptype", "<{_fxyptype}>")~_ptyplst
 Color Shading:   <= n{0}        >~setvar("_fxycmap",  <{_fxycmap}>)~_chooseshading
 <L>
 

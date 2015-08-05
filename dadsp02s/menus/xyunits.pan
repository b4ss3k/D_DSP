! xyunits.pan
@x0
@y0
@b{_bg2}
@f{_fg2}
@panel
{if(_xydtf, setvar("_xyvun", _gcunit(eval('_ser3'), eval('_col3'))), setvar("_xyvun", _gcunit(eval('_ser2'), eval('_col2'))))} 
{if(_xydtf, setvar("_xyhun", "Time"), setvar("_xyhun", _gcunit(eval('_ser1'), eval('_col1'))))} 

Data Settings
<>
 (Y) Vertical Units   :  <*                   >  ~_DEFVUNITS("<{_xyvun}>") ~_unitslist
 (X) Horizontal Units :  <*                   >  ~_DEFHUNITS("<{_xyhun}>") ~_unitslist


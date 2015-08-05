! mcinfo.pan
@panel
@x0
@y0
{defmacro('_flyflg',0,1)}
{defvar("_xx", 1)}
{setvar("_ochanno", _usechanno)}

     Series Information (3 of 3)

Series Number:    <= #          >~setvar("_xx", <{_xx}>)~_numlist(numstr(_impchans))
Original Channel: <= # n x{-1} y{-1} >~setvar("_xx", 1+<{_xx-1}>)~_orgchanlist()
< >
Series Parameters <L>
  Series Name: <%              >~_setservar(_xx, _seriesflag, '<{_getservar(_xx, _seriesflag)}>')~INPUT(5)
Use Channel Numbers <c # x{-1} y{-1} >~setvar("_usechanno", <{_usechanno}>);if(_ochanno!=_usechanno,_resetservar())~<0><1>
  Vert. Units: <% *            >~_sethedvar('_unitsv', _xx, _vunitsflag, '<{_gethedvar("_unitsv", _xx, _vunitsflag)}>')~_unitslist
For All Series        <c % x{-1} y{-1}>~setvar("_vunitsflag", "<{_vunitsflag}>");if(_vunitsflag=="NO",_sethedvar("_unitsv", _xx, "NO", _gethedvar("_unitsv", _xx, "YES")))~<YES><NO>

  Horiz. Units: <% *            >~_sethedvar('_unitsh', _xx, _hunitsflag, '<{_gethedvar("_unitsh", _xx, _hunitsflag)}>')~_unitslist
For All Series        <c % x{-1} y{-1}>~setvar("_hunitsflag", "<{_hunitsflag}>");if(_hunitsflag=="NO",_sethedvar("_unitsh", _xx, "NO", _gethedvar("_unitsh", _xx, "YES")))~<YES><NO>
Data & Axis Scaling <L>

     Y Offset: <%              >~_sethedvar('_offsety', _xx, _yoffflag, '<{_gethedvar("_offsety", _xx, _yoffflag)}>')~INPUT(1)
For All Series        <c % x{-1} y{-1}>~setvar("_yoffflag", "<{_yoffflag}>");if(_yoffflag=="NO",_sethedvar("_offsety", _xx, "NO", _gethedvar("_offsety", _xx, "YES")))~<YES><NO>
     Y Slope:  <%              >~_sethedvar('_slopey', _xx, _slopeflag, '<{_gethedvar("_slopey", _xx, _slopeflag)}>')~INPUT(1)
For All Series        <c % x{-1} y{-1}>~setvar("_slopeflag", "<{_slopeflag}>");if(_slopeflag=="NO",_sethedvar("_slopey", _xx, "NO", _gethedvar("_slopey", _xx, "YES")))~<YES><NO>
     X Offset: <%              >~_sethedvar('_offsetx', _xx, _xoffflag, '<{_gethedvar("_offsetx", _xx, _xoffflag)}>')~INPUT(1)
For All Series        <c % x{-1} y{-1}>~setvar("_xoffflag", "<{_xoffflag}>");if(_xoffflag=="NO",_sethedvar("_offsetx", _xx, "NO", _gethedvar("_offsetx", _xx, "YES")))~<YES><NO>
Acquisition Parameters <L>
Sampling Rate: <%              >~_sethedvar('_samprate', _xx, _rateflag, '<{_gethedvar("_samprate", _xx, _rateflag)}>')~INPUT(1)
For All Series        <c % x{-1} y{-1}>~setvar("_rateflag", "<{_rateflag}>");if(_rateflag=="NO",_sethedvar("_samprate", _xx, "NO", _gethedvar("_samprate", _xx, "YES")))~<YES><NO>

Points Per Channel: <% *              >~_sethedvar('_numpts', _xx, _impptsflag, '<{_toall(_gethedvar("_numpts", _xx, _impptsflag))}>')~_intalllist(_gethedvar("_numpts", _xx, _impptsflag))
For All Series      <c % x{-1} y{-1}>~setvar("_impptsflag", "<{_impptsflag}>");if(_impptsflag=="NO",_sethedvar("_numpts", _xx, "NO", _gethedvar("_numpts", _xx, "YES")))~<YES><NO>
Import All Points   <c % x{-1} y{-1} e{_modestore=="INTERLACED"}>~setvar("_pointsall", <{_pointsall}>)~<0><1>

~menuclear;defmacro('_flyflg',1,1)

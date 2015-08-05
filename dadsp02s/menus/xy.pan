! xy.pan - Inputs two series
@f{_fg1}
@b{_bg1}
@panel
@form
@h~help(_xyserhelp)
XY Series
{_setcol(_ser1, '_col1');_setcol(_ser2, '_col2')}
{defvar("_xyiauto", 0)}
{defvar("_xyitv", 1.0)}
{defvar("_xyius", 1.0)}
{defvar("_xydtf", 0)}

{initxyform(_xydtf)}

{if(_xyiauto && eval(sprintf("length(%s)>0",_ser1)) && eval(sprintf("length(%s)>0", _ser2)),setvar("_xyitv", castreal(eval(sprintf("xyinterp(col(%s, %d), col(%s, %d), 0.0, 1)", _ser1, _col1, _ser2, _col2)))),setvar("_xyitv", _xyius))}

XY Plot Type <## r h n{0} x{5} t{"' Standard X Series vs Y Series Plot | XY Plot from Date, Time and Y series '"} >~setvar("_xydtf", <{_xydtf}>)~<X vs Y><XY Date Time>
<L>
 {_xyser1mes}   <## *  w{25}          >~_DEFSER1(strcat("'","<{_frmcurr(_SER1)}>","'"))~_pickser(_ser1)
 {_col1prompt}  <## *  w{25}          >~_DEFCOL1(strcat("'","<{_COL1}>","'"))~_collist(_ser1, "_nc1")
 <L>
 {_xyser2mes}   <## *  w{25}          >~_DEFSER2(strcat("'","<{_frmcurr(_SER2)}>","'"))~_pickser(_ser2)
 {_col2prompt}  <## *  w{25}          >~_DEFCOL2(strcat("'","<{_COL2}>","'"))~_collist(_ser2, "_nc2")
 <L>
 {_xyser3mes}   <## *  w{25} v{_xydtf}>~_DEFSER3(strcat("'","<{_frmcurr(_SER3)}>","'"))~_pickser(_ser3)
 {_intpxyprompt} <# c y{-1} v{not(_xydtf)} t{_xyintrptip} >~_DEFXYINTRP("<{_xyintrp}>")~<0><1>
 {_col1prompt}  <## *  w{25} v{_xydtf}>~_DEFCOL3(strcat("'","<{_COL3}>","'"))~_collist(_ser3, "_nc3")
 {_intpivprompt} <# y{-1} v{_xyintrp&&not(_xydtf)} e{_xyintrp&&not(_xyiauto)} w{25}>~setvar("_xyius", <{_xyitv}>);setvar("_xyitv", _xyius)~input(1, realmin)
 {_automaticstr} <# c v{_xyintrp&&not(_xydtf)} x{-1} y{-1}>~setvar("_xyiauto", <{_xyiauto}>)~<0><1>
 <L>
 {_dwinstrS("w25")}
 <L>
 {sprintf("%-65.65s", sprintf(_apprxlenstr1,if(eval(sprintf("length(%s)>0&&length(%s)>0",_ser1,_ser2)),eval(sprintf("(max(col(%s,%d))-min(col(%s,%d)))/_xyitv",_ser1,_col1,_ser1,_col1)),0)))}   <w{65} V{_xyintrp&&not(_xydtf)}>
 {sprintf("%-65.65s", sprintf(_apprxlenstr2,if(eval(sprintf("length(%s)>0&&length(%s)>0",_ser1,_ser2)),eval(sprintf("max(length(col(%s,%d)),length(col(%s,%d)))",_ser1,_col1,_ser2,_col2)),0)))} <w{65} V{not(_xyintrp)&&not(_xydtf)}) x{-2} y{-3}>
 <L v{not(_xydtf)}>

~if(strcmp(_ser1,_dwin)==0,_DEFSER1("'curr'"));if(strcmp(_ser2,_dwin)==0,_DEFSER2("'curr'"))
~_verifydwin2(eval('_ser1'), eval('_ser2'))
~_formstr = if(_chkwinok,_s2c2(eval('_ser1'), eval('_col1'), eval('_ser2'), eval('_col2'), eval('_ser3'), eval('_col3'), eval('_xyintrp'), _nc1, _nc2, _nc3, _xyitv, _xyiauto, _xydtf), "")

@endform

initxyform(is_xydt)
{
	if (is_xydt) {
		setvar("_xyser1mes", "Date Series");
		setvar("_xyser2mes", "Time Series");
		setvar("_xyser3mes", "Y Series");
		setvar("_xyserhelp", "xydt");

		_DEFVUNITS(_gcunit(eval('_ser3'), eval('_col3')));
		_DEFHUNITS('Time');

	}
	else {
		setvar("_xyser1mes", "X Series");
		setvar("_xyser2mes", "Y Series");
		setvar("_xyser3mes", "Y Series");
		setvar("_xyserhelp", "xy");

		_DEFVUNITS(_gcunit(eval('_ser2'), eval('_col2')));
		_DEFHUNITS(_gcunit(eval('_ser1'), eval('_col1')));
	}
	setvar("_xyintrptip", "' Interpolate XY Result to Interval Series with a Constant Sample Rate '");
}

		
! xyinterp.pan - Interpolates XY data
@f{_fg1}
@b{_bg1}
@panel
@h~help("xyinterp")
{defvar("_xyiauto", 1)}
{defvar("_xyitv", 1.0)}
{defvar("_xyius", 1.0)}
{if(_xyiauto && eval(sprintf("length(%s)>0",_ser1)) && eval(sprintf("length(%s)>0", _ser2)),setvar("_xyitv", castreal(eval(sprintf("xyinterp(%s, 0.0, 1)", _ser1)))),setvar("_xyitv", _xyius))}


{_funcstr}
{_formatstr}
{_examplestr}
<L>
 {_ser1prompt}  <* # w{25}        >~_DEFSER1(strcat("'","<{_frmcurr(_SER1)}>","'"))~_pickser(_ser1)
 {_real1prompt} <# e{not(_xyiauto)} w{25}>~setvar("_xyius", <{_xyitv}>);setvar("_xyitv", _xyius)~input(1, realmin)
 {_str1prompt}  <c # x{-1} y{-1}  >~setvar("_xyiauto", <{_xyiauto}>)~<0><1>
 <L>
 {_dwinstrS("w25")}
 <L>
 {sprintf("%-65.65s", sprintf(_apprxlenstr1,if(eval(sprintf("length(%s)>0&&length(%s)>0",_ser1,_ser2)),eval(sprintf("(max(xvals(%s))-min(xvals(%s)))/_xyitv",_ser1,_ser1)),0)))}   <w{65}>
 <L>

~if(strcmp(_ser1,_dwin)==0,_DEFSER1("'curr'"));
~_verifydwin(eval('_ser1'))
~if(_chkwinok,if(_xyiauto, eval(sprintf("Setwf(%s, 'Xyinterp(%s)')", _dwin, eval('_ser1'))), eval(sprintf("Setwf(%s, 'Xyinterp(%s, %g)')", _dwin, eval('_ser1'), _xyius))))

! xylookup.pan - Inputs series
@f{_fg1}
@b{_bg1}
@panel
@justifylabels 3
@h
Xylookup
{_setcol(_ser1, '_col1');_setcol(_ser2, '_col2');}
{defvar("_xylookxy", 0)}
 XY Data Input   <# x{5} r n h t" Single Interval or XY Series | Separate X and Y Input Series "   >~setvar("_xylookxy", <{_xylookxy}>)~<Single Series>~<Separate X and Y Series>
 X Series        <# * w30 v{_xylookxy}              t" Input X Values "                            >~_DEFSER1(strcat("'","<{_frmcurr(_SER1)}>","'"))~_pickser(_ser1)
 Input Series    <# * w30 v{not(_xylookxy)} y{-1}       t" Interval or XY Series to Interpolate from " >~_DEFSER1(strcat("'","<{_frmcurr(_SER1)}>","'"))~_pickser(_ser1)
 Y Series        <# * w30 v{_xylookxy}  x{-1} y{-1} t" Input Y Values "                            >~_DEFSER2(strcat("'","<{_frmcurr(_SER2)}>","'"))~_pickser(_ser2)
 X Column Number <# * w30 v{_xylookxy}              t" Input X Value Column "                      >~_DEFCOL1(strcat("'","<{_COL1}>","'"))~_collist(_ser1, "_nc1")
 Y Column Number <# * w30 v{_xylookxy}  x{-1} y{-1} t" Input Y Value Column "                      >~_DEFCOL2(strcat("'","<{_COL2}>","'"))~_collist(_ser2, "_nc2")
 <L>
 New X Values    <# * w30 t" Desired Output X Values " >~_DEFSER3(strcat("'","<{_frmcurr(_SER3)}>","'"))~_pickser(_ser3)
 <L>
 {_dwinstrS("w30")}
 <L>
~if(_xylookxy,    if(strcmp(_ser1,_dwin)==0,_DEFSER1("'curr'"));if(strcmp(_ser2,_dwin)==0,_DEFSER2("'curr'")))
~if(_xylookxy,    _verifydwin2(eval('_ser1'), eval('_ser2')))
~if(_xylookxy==0, if(strcmp(_ser1,_dwin)==0,_DEFSER1("'curr'")))
~if(_xylookxy==0, _verifydwin(eval('_ser1')))
~if(_chkwinok, _formstr = _xylform(eval('_ser1'), eval('_col1'), eval('_ser2'), eval('_col2'), eval('_ser3'), _xylookxy, _xylintp, _xyloor), _formstr = "");


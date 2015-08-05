! igrid.pan - Inputs three series
@f{_fg1}
@b{_bg1}
@panel
@justifylabels 3
@h
{_xyztitle}
{_setcol(_ser1, '_col1');_setcol(_ser2, '_col2');_setcol(_ser3, '_col3')}
{defvar("_igridxyz", 1)}
<>
 XYZ Data Input <## x{5} r n h >~setvar("_igridxyz", <{_igridxyz}>)~<Separate X, Y and Z Series>~<Single XYZ Series>
 {_ser1prompt}  <## * v{not(_igridxyz)}   >~_DEFSER1(strcat("'","<{_frmcurr(_SER1)}>","'"))~_pickser(_ser1)
 XYZ Series     <## * v{_igridxyz} y{-1}>~_DEFSER1(strcat("'","<{_frmcurr(_SER1)}>","'"))~_pickser(_ser1)
 {_ser2prompt}  <## * v{not(_igridxyz)} x{-1} y{-1}  >~_DEFSER2(strcat("'","<{_frmcurr(_SER2)}>","'"))~_pickser(_ser2)
 {_ser3prompt}  <## * v{not(_igridxyz)} x{-1} y{-1}  >~_DEFSER3(strcat("'","<{_frmcurr(_SER3)}>","'"))~_pickser(_ser3)
 {_col1prompt}  <## * v{not(_igridxyz)}              >~_DEFCOL1(strcat("'","<{_COL1}>","'"))~_collist(_ser1, "_nc1")
 {_col2prompt}  <## * v{not(_igridxyz)} x{-1} y{-1}  >~_DEFCOL2(strcat("'","<{_COL2}>","'"))~_collist(_ser2, "_nc2")
 {_col3prompt}  <## * v{not(_igridxyz)} x{-1} y{-1}  >~_DEFCOL3(strcat("'","<{_COL3}>","'"))~_collist(_ser3, "_nc3")
 <L>
 {_dwinstr}
 <L>

~if(_igridxyz==0, if(strcmp(_ser1,_dwin)==0,_DEFSER1("'curr'"));if(strcmp(_ser2,_dwin)==0,_DEFSER2("'curr'")))
~if(_igridxyz==0, if(strcmp(_ser3,_dwin)==0,_DEFSER3("'curr'")))
~if(_igridxyz==0, _verifydwin3(eval('_ser1'), eval('_ser2'),eval('_ser3')))
~if(_igridxyz==0, _formstr = if(_chkwinok,_s3c3("XYZ", eval('_ser1'), eval('_col1'), eval('_ser2'), eval('_col2'), eval('_ser3'), eval('_col3'),  _nc1, _nc2, _nc3), ""))
~if(_igridxyz,    if(strcmp(_ser1,_dwin)==0,_DEFSER1("'curr'")))
~if(_igridxyz,    _verifydwin(eval('_ser1')))
~if(_igridxyz,    _formstr = if(_chkwinok, eval('_ser1')))

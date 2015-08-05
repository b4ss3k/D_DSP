! xyz.pan - Inputs three series
@f{_fg1}
@b{_bg1}
@panel
@h
{_xyztitle}
{_setcol(_ser1, '_col1');_setcol(_ser2, '_col2');_setcol(_ser3, '_col3')}

<>
 {_ser1prompt}  <## *                 >~_DEFSER1(strcat("'","<{_frmcurr(_SER1)}>","'"))~_pickser(_ser1)
 {_col1prompt}  <## *                 >~_DEFCOL1(strcat("'","<{_COL1}>","'"))~_collist(_ser1, "_nc1")
 <L>
 {_ser2prompt}  <## *                 >~_DEFSER2(strcat("'","<{_frmcurr(_SER2)}>","'"))~_pickser(_ser2)
 {_col2prompt}  <## *                 >~_DEFCOL2(strcat("'","<{_COL2}>","'"))~_collist(_ser2, "_nc2")
 <L>
 {_ser3prompt}  <## *                 >~_DEFSER3(strcat("'","<{_frmcurr(_SER3)}>","'"))~_pickser(_ser3)
 {_col3prompt}  <## *                 >~_DEFCOL3(strcat("'","<{_COL3}>","'"))~_collist(_ser3, "_nc3")
 <L>
 {_dwinstr}
 <L>

~if(strcmp(_ser1,_dwin)==0,_DEFSER1("'curr'"));if(strcmp(_ser2,_dwin)==0,_DEFSER2("'curr'"))
~if(strcmp(_ser3,_dwin)==0,_DEFSER3("'curr'"))
~_verifydwin3(eval('_ser1'), eval('_ser2'),eval('_ser3'))
~_formstr = if(_chkwinok,_s3c3("XYZ", eval('_ser1'), eval('_col1'), eval('_ser2'), eval('_col2'), eval('_ser3'), eval('_col3'),  _nc1, _nc2, _nc3), "")

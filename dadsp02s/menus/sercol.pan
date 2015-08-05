! Sercol.pan - Inputs series and column
@f{_fg1}
@b{_bg1}
@panel
@h
{_funcstr}
{_formatstr}
{_examplestr}
 <L>
 {_ser1prompt} <# *                 >~_DEFSER1(strcat("'","<{_frmcurr(_SER1)}>","'"))~_pickser(_ser1)
 {_col1prompt} <*                   >~_DEFCOL1(strcat("'","<{_COL1}>","'"))~_collist(_ser1)
 <L>
 {_dwinstr}
 <L>
~if(strcmp(_ser1,_dwin)==0,_DEFSER1("'curr'"))
~_verifydwin(eval('_ser1'))

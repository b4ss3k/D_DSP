! Serint2.pan - inputs a series and two integers              
@f{_fg1}
@b{_bg1}
@panel
@h
{_funcstr}
{_formatstr}
{_examplestr}
 <L>
 {_serprompt } <*             >~_DEFSER1(strcat("'","<{_frmcurr(_SER1)}>","'"))~_pickser(_ser1)
 {_int1prompt} <              >~_DEFINT1(strcat("'","<{_INT1}>","'"))~_ININT("Integer Number")
 {_int2prompt} <              >~_DEFINT2(strcat("'","<{_INT2}>","'"))~_ININT("Integer Number")
 <L>
 {_dwinstr}
 <L>
~if(strcmp(_ser1,_dwin)==0,_DEFSER1("'curr'"))
~_verifydwin(eval('_ser1'))

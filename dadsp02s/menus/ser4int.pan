! intser4.pan - inputs an integer value and 4 series 
@f{_fg1}
@b{_bg1}
@panel
@h
{_funcstr}
{_formatstr}
{_examplestr}
 <L>
 {_ser1prompt} <*             >~_DEFSER1(strcat("'","<{_frmcurr(_SER1)}>","'"))~_pickser(_ser1)
 {_ser2prompt} <*             >~_DEFSER2(strcat("'","<{_frmcurr(_SER2)}>","'"))~_pickser(_ser2)
 {_ser3prompt} <*             >~_DEFSER3(strcat("'","<{_frmcurr(_SER3)}>","'"))~_pickser(_ser3)
 {_ser4prompt} <*             >~_DEFSER4(strcat("'","<{_frmcurr(_SER4)}>","'"))~_pickser(_ser4)
 {_int1prompt} <              >~_DEFINT1(strcat("'","<{_INT1}>","'"))~_ININT("Integer Value")
 <L>
 {_dwinstr}
 <L>
~if(strcmp(_ser1,_dwin)==0,_DEFSER1("'curr'"));if(strcmp(_ser2,_dwin)==0,_DEFSER2("'curr'"));if(strcmp(_ser3,_dwin)==0,_DEFSER3("'curr'"));if(strcmp(_ser4,_dwin)==0,_DEFSER4("'curr'"))
~_verifydwin4(eval('_ser1'), eval('_ser2'), eval('_ser3'), eval('_ser4')) 

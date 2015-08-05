! ser5c.pan - inputs an integer value and 5 series 
@f{_fg1}
@b{_bg1}
@panel
@h
{_funcstr}
{_formatstr}
{_examplestr}

{defvar("_eser5", 0);defvar("_chk2", "1")}

 <L>
 {_ser1prompt} <* %           >~_DEFSER1(strcat("'","<{_frmcurr(_SER1)}>","'"))~_pickser(_ser1)
 {_ser2prompt} <* %           >~_DEFSER2(strcat("'","<{_frmcurr(_SER2)}>","'"))~_pickser(_ser2)
 {_ser3prompt} <* %           >~_DEFSER3(strcat("'","<{_frmcurr(_SER3)}>","'"))~_pickser(_ser3)
 {_ser4prompt} <* %           >~_DEFSER4(strcat("'","<{_frmcurr(_SER4)}>","'"))~_pickser(_ser4)
 {_ser5prompt} <* % e{_eser5} >~_DEFSER5(strcat("'","<{_frmcurr(_SER5)}>","'"))~_pickser(_ser5)
 {_eser5prompt} <# c x{-1} y{-1} >~setvar("_eser5", <{_eser5}>)~<0><1>
 <L>
 {_chk2prompt} < c  %    >~setvar("_chk2", "<{_chk2}>")~<0><1>
 <L>
 {_dwinstr}
 <L>
~if(strcmp(_ser1,_dwin)==0,_DEFSER1("'curr'"));if(strcmp(_ser2,_dwin)==0,_DEFSER2("'curr'"));if(strcmp(_ser3,_dwin)==0,_DEFSER3("'curr'"));if(strcmp(_ser4,_dwin)==0,_DEFSER4("'curr'"));if(_eser5, if(strcmp(_ser5,_dwin)==0,_DEFSER5("'curr'")))
~if(_eser5, _verifydwin4(eval('_ser1'), eval('_ser2'), eval('_ser3'), eval('_ser4')), _verifydwin5(eval('_ser1'), eval('_ser2'), eval('_ser3'), eval('_ser4'), eval('_ser5')))
 

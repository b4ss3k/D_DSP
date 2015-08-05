! Ser2c.pan - inputs two series and a boolean
@f{_fg1}
@b{_bg1}
@panel
@h
{_funcstr}
{_formatstr}
{_examplestr}

{defvar("_chk2", 0)}

<L>
 {_ser1prompt } <*             >~_DEFSER1(strcat("'","<{_frmcurr(_SER1)}>","'"))~_pickser(_ser1)
 {_ser2prompt } <*             >~_DEFSER2(strcat("'","<{_frmcurr(_SER2)}>","'"))~_pickser(_ser2)
<L>
 {_chk1prompt} <c             >~setvar("_chk2",  <{_chk2}>)~<0><1>
<L>
{_dwinstr}
<L>
~if(strcmp(_ser1,_dwin)==0,_DEFSER1("'curr'"));if(strcmp(_ser2,_dwin)==0,_DEFSER2("'curr'"))
~_verifydwin2(eval('_ser1'), eval('_ser2'))

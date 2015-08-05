! Ser1c.pan - inputs a series and a boolean
@f{_fg1}
@b{_bg1}
@panel
@h
{_funcstr}
{_formatstr}
{_examplestr}

{defvar("_chk1", 1)}

<L>
 {_serprompt } <*             >~_DEFSER1(strcat("'","<{_frmcurr(_SER1)}>","'"))~_pickser(_ser1)
<L>
 {_chk1prompt} <c             >~setvar("_chk1",  <{_chk1}>)~<0><1>
<L>
{_dwinstr}
<L>
~if(strcmp(_ser1,_dwin)==0,_DEFSER1("'curr'"))
~_verifydwin(eval('_ser1'))

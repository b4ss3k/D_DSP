! SerColor.pan - inputs a series and an integer              
@f{_fg1}
@b{_bg1}
@panel
@h
{defvar("_ovpform", 0)}
{_funcstr}
{_formatstr}
{_examplestr}

 <L>
 {_serprompt } <*                  >~_DEFSER1(strcat("'",_tocurr("<{_frmcurr(_SER1)}>"),"'"))~_pickser(_ser1)
 {_clr1prompt} <= p n              >~defmacro("_OCOLOR",'"<{eval(_OCOLOR)}>"',1)|_DEFCLR1(strcat("'",eval('_OCOLOR'),"'"))~_choosecolor
 <>
 {_addformstr} <c                  >~setvar("_ovpform", <{_ovpform}>)~<0><1>
 <L>
 {_cwinstr}
 <L>
~setvar("_dwin", _getcwin)
~_verifysrc(eval('_ser1'))

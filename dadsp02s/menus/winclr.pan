! winclr.pan - inputs a window and an integer              
@f{_fg1}
@b{_bg1}
@panel
@h
{defvar("_ovlform", 0)}
{_funcstr}
{_formatstr}
{_examplestr}

 <L>
 {_serprompt } <*                  >~_DEFSER1(strcat("'",_tocurr("<{_frmcurr(_SER1)}>"),"'"))~_winlist
 {_clr1prompt} <= p n              >~defmacro("_OCOLOR",'"<{eval(_OCOLOR)}>"',1)|_DEFCLR1(strcat("'",eval('_OCOLOR'),"'"))~_choosecolor
 <L>
 {_syncprompt} <n                  >~setvar("_syncm", <{getsync}>)~<Independent><X><Y><XY><X Expand><Y Expand><XY Expand>
 <L>
 {_addformstr} <c                  >~setvar("_ovlform", <{_ovlform}>)~<0><1>
 <L>
 {_cwinstr}
 <L>
~setvar("_dwin", _getcwin)
~_verifysrc(eval('_ser1'))

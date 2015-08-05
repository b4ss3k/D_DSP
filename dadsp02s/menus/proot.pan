! proot.pan - polyroot
@f{_fg1}
@b{_bg1}
@panel
@h
{_funcstr}
{_formatstr}
{_examplestr}

{defvar("_prootfrm", 0)}

 <L>
 {_ser1prompt} <*                   >~_DEFSER1(strcat("'","<{_frmcurr(_SER1)}>","'"))~_pickser(_ser1)
 <>
 {_rad1prompt} <r n                 >~setvar("_prootfrm", <{_prootfrm}>)~<a0+a1*x+a2*x^2+...+aN*x^N   Ascending><aN*x^N+...+a2*x^2+a1*x+a0   Descending>
 <L>
 {_dwinstr}
 <L>
~if(strcmp(_ser1,_dwin)==0,_DEFSER1("'curr'"));
~_verifydwin(eval('_ser1'))
~_formstr = if(_prootfrm, sprintf('setwform(%s, "polyroot(%s, %d)")', _dwin, _ser1, _prootfrm), sprintf('setwform(%s, "polyroot(%s)")', _dwin, _ser1))
~if(_chkwinok, eval(_formstr))

! iminterp.pan
@f{_fg1}
@b{_bg1}
@panel
@h
{_funcstr}
{_formatstr}
{_examplestr}

{defvar("_imlev", 5);defvar("_imrad", 0)}

 <L>
 {_serprompt } <* #           >~_DEFSER1(strcat("'","<{_frmcurr(_SER1)}>","'"))~_pickser(_ser1)
 {_int1prompt} <  % d{1}      >~setvar("_imlev", <{_imlev}>)~_ININT("Integer Number")
 <L>
 {_chk1prompt} <r #          >~setvar("_imrad", _im2int("<{_im2str(_imrad)}>"))~<{_linearstr}><{_splinestr}>
 {_dwinstr}
 <L>
~if(strcmp(_ser1,_dwin)==0,_DEFSER1("'curr'"))
~_verifydwin(eval('_ser1'))

~if(_checkdwin, eval(sprintf("setwf(%s, 'Iminterp(%s, %d, %d)')", eval('_dwin'), eval('_ser1'), _imlev, _imrad)))

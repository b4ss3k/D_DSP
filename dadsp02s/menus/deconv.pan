! deconv.pan - deconvolution panel
@f{_fg1}
@b{_bg1}
@panel
@h
{_funcstr}
{_formatstr}
{_examplestr}

{defvar("_dcmode", 0)}

 <L>
 {_ser1prompt } <* #           >~_DEFSER1(strcat("'","<{_frmcurr(_SER1)}>","'"))~_pickser(_ser1)
 {_ser2prompt } <* #           >~_DEFSER2(strcat("'","<{_frmcurr(_SER2)}>","'"))~_pickser(_ser2)
 <>
 {_r1prompt  } <r %                      >~setvar("_dcmode", _dom2int("<{_int2dom(_dcmode)}>"))~<{_fdomainstr}><{_tdomainstr}>

 {_dwinstr}
 <L>
~if(strcmp(_ser1,_dwin)==0,_DEFSER1("'curr'"))
~if(strcmp(_ser2,_dwin)==0,_DEFSER2("'curr'"))
~_verifydwin2(eval('_ser1'), eval('_ser2'))

~if(_checkdwin, _dconv("Deconv", "Fdeconv", _ser1, _ser2, _dcmode, _dwin))

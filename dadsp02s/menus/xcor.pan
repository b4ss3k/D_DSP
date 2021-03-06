! xcor.pan - cross correlation panel
@f{_fg1}
@b{_bg1}
@panel
@h
{_funcstr}
{_formatstr}
{_examplestr}

{defvar("_xcmode", 0);defvar("_xcnorm", 0)}

 <L>
 {_ser1prompt } <* #           >~_DEFSER1(strcat("'","<{_frmcurr(_SER1)}>","'"))~_pickser(_ser1)
 {_ser2prompt } <* #           >~_DEFSER2(strcat("'","<{_frmcurr(_SER2)}>","'"))~_pickser(_ser2)
 <>
 {_r1prompt  } <r % x{5}                 >~setvar("_xcmode", _dom2int("<{_int2dom(_xcmode)}>"))~<{_fdomainstr}><{_tdomainstr}><><>
 {_r2prompt  } <r % x{-1} y{-1}          >~setvar("_xcnorm", _nrm2int("<{_int2nrm(_xcnorm)}>"))~<{_nonestr}><{_normalizedstr}><{_biasedstr}><{_unbiasedstr}>

 {_dwinstr}
 <L>
~if(strcmp(_ser1,_dwin)==0,_DEFSER1("'curr'"))
~if(strcmp(_ser2,_dwin)==0,_DEFSER2("'curr'"))
~_verifydwin2(eval('_ser1'), eval('_ser2'))

~if(_checkdwin, _xcorcov("Xcorr", "Fxcorr", _ser1, _ser2, _xcmode, _xcnorm, _dwin))

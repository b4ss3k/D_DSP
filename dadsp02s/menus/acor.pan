! acor.pan - autocorelation panel
@f{_fg1}
@b{_bg1}
@panel
@h
{_funcstr}
{_formatstr}
{_examplestr}

{defvar("_acmode", 0);defvar("_acnorm", 0)}

 <L>
 {_serprompt } <* #           >~_DEFSER1(strcat("'","<{_frmcurr(_SER1)}>","'"))~_pickser(_ser1)
 <>
 {_r1prompt  } <r % x{5}                 >~setvar("_acmode", _dom2int("<{_int2dom(_acmode)}>"))~<{_fdomainstr}><{_tdomainstr}><><>
 {_r2prompt  } <r % x{-1} y{-1}          >~setvar("_acnorm", _nrm2int("<{_int2nrm(_acnorm)}>"))~<{_nonestr}><{_normalizedstr}><{_biasedstr}><{_unbiasedstr}>

 {_dwinstr}
 <L>
~if(strcmp(_ser1,_dwin)==0,_DEFSER1("'curr'"))
~_verifydwin(eval('_ser1'))

~if(_checkdwin, _acorcov("Acorr", "Facorr", _ser1, _acmode, _acnorm, _dwin))

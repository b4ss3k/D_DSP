! acov.pan - autocovariance panel
@f{_fg1}
@b{_bg1}
@panel
@h
{_funcstr}
{_formatstr}
{_examplestr}

{defvar("_acvmode", 0);defvar("_acvnorm", 0)}

 <L>
 {_serprompt } <* #           >~_DEFSER1(strcat("'","<{_frmcurr(_SER1)}>","'"))~_pickser(_ser1)
 <>
 {_r1prompt  } <r % x{5}                 >~setvar("_acvmode", _dom2int("<{_int2dom(_acvmode)}>"))~<{_fdomainstr}><{_tdomainstr}><><>
 {_r2prompt  } <r % x{-1} y{-1}          >~setvar("_acvnorm", _nrm2int("<{_int2nrm(_acvnorm)}>"))~<{_nonestr}><{_normalizedstr}><{_biasedstr}><{_unbiasedstr}>

 {_dwinstr}
 <L>
~if(strcmp(_ser1,_dwin)==0,_DEFSER1("'curr'"))
~_verifydwin(eval('_ser1'))

~if(_checkdwin, _acorcov("Acov", "Facov", _ser1, _acvmode, _acvnorm, _dwin))

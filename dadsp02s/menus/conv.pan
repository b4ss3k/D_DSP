! conv.pan - convolution panel
@f{_fg1}
@b{_bg1}
@panel
@h
{_funcstr}
{_formatstr}
{_examplestr}

{defvar("_cnvmode", 0);defvar("_cnvmeth", 0)}

 <L>
 {_ser1prompt } <* # t{"' First Input Series '"} >~_DEFSER1(strcat("'","<{_frmcurr(_SER1)}>","'"))~_pickser(_ser1)
 {_ser2prompt } <* # t{"' Second Input Series '"}>~_DEFSER2(strcat("'","<{_frmcurr(_SER2)}>","'"))~_pickser(_ser2)
 <>
 {_r1prompt  } <r % x{5} t{"' FFT Method | Direct Convolution '"} >~setvar("_cnvmode", _dom2int("<{_int2dom(_cnvmode)}>"))~<{_fdomainstr}><{_tdomainstr}>
 {_r2prompt  } <r % n x{-1} y{-1} t{"' Standard Linear Convolution | Circular (Periodic) Convolution '"}>~setvar("_cnvmeth", <{_cnvmeth}>)~<{_linstr}><{_cirstr}>
 <L>
 {_dwinstr}
 <L>
~if(strcmp(_ser1,_dwin)==0,_DEFSER1("'curr'"))
~if(strcmp(_ser2,_dwin)==0,_DEFSER2("'curr'"))
~_verifydwin2(eval('_ser1'), eval('_ser2'))

~if(_checkdwin, _conv(_ser1, _ser2, _cnvmode, _cnvmeth, _dwin))

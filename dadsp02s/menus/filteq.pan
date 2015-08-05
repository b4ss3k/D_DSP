! filteq.pan - inputs 3 series 
@f{_fg1}
@b{_bg1}
@panel
@h
{_funcstr}
{_formatstr}
{_examplestr}
{_defzf(); defvar("_ser4chk", 0); defvar("_ser5chk", 0)}
 <L>
 {_ser1prompt} <* % w{40} t{"' Numerator Coefficients in Ascending Powers of z^(-1) '"}   >~setvar("_zfser1", "<{_frmcurr(_zfser1)}>")~_pickser(_zfser1)
 {_ser2prompt} <* % w{40} t{"' Denominator Coefficients in Ascending Powers of z^(-1) '"} >~setvar("_zfser2", "<{_frmcurr(_zfser2)}>")~_pickser(_zfser2)
 {_ser3prompt} <* % w{40} t{"' Input Data '"} >~_DEFSER3(strcat("'","<{_frmcurr(_SER3)}>","'"))~_pickser(_ser3)

<L>
 {_ser4prompt} <* e{_ser4chk} % w{40} t{"' Initial Conditions for y[n] '"} >~_DEFSER4(strcat("'","<{_frmcurr(_SER4)}>","'"))~_pickser(_ser4)
 {_int1prompt} <c # x{-1} y{-1}       t{"' Set Initial Conditions for y[n] '"}>~setvar("_ser4chk", <{_ser4chk}>)~<0><1>
 {_ser5prompt} <* e{_ser5chk} % w{40} t{"' Initial Conditions for x[n] '"} >~_DEFSER5(strcat("'","<{_frmcurr(_SER5)}>","'"))~_pickser(_ser5)
 {_int2prompt} <c # x{-1} y{-1}       t{"' Set Initial Conditions for x[n] '"}>~setvar("_ser5chk", <{_ser5chk}>)~<0><1>
 <L>
 {_dwinstrS("w40")}
 <L>
~if(strcmp(_zfser1,_dwin)==0,_DEFSER1("'curr'"));if(strcmp(_zfser2,_dwin)==0,_DEFSER2("'curr'"));if(strcmp(_ser3,_dwin)==0,_DEFSER3("'curr'"));
~_verifydlen
~_filteq(eval('_zfser1'), eval('_zfser2'), eval('_ser3'), eval('_ser4'), _ser4chk, eval('_ser5'), _ser5chk, _dwin)

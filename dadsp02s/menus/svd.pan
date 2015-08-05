! fft2win.pan - Input FFT2 parameters
@f{_fg1}
@b{_bg1}
@panel
@h
{_funcstr}
{_formatstr}
{_examplestr}

{defvar("_svdform", 0)}

 <L>
 Input Array: <* %                   >~_DEFSER1(strcat("'","<{_frmcurr(_SER1)}>","'"))~_pickser(_ser1)
 <L>
 Output Form  <r n x{5} %            >~setvar("_svdform", <{_svdform}>)~<Singular Values (W)><Right Singular Value Matrix (V)><Left Singular Value Matrix (U)><Combined Matrix (U, V, W)>
 <L y{-2}>
 {_dwinstr}
 <L>
~if(strcmp(_ser1,_dwin)==0,_DEFSER1("'curr'"))
~_verifydwin(eval('_ser1'))

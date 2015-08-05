! fft2d.pan -- 2 dimensional fft
@b{_bg1}
@f{_fg1}
@panel
@h
FFT2     2 Dimensional FFT 
Format:  FFT2(matrix)
Example: FFT2(W3)

<L>
 Input Matrix: <*             >~_DEFSER1(strcat("'",_tocurr("<{_frmcurr(_SER1)}>"),"'"))~_pickser(_ser1)
<L>
{_dwinstr}
<L>
~_mc;if(strcmp(_ser1,_dwin)==0,_DEFSER1("'curr'"))
~eval(strcat("setwf(",_dwin,",'FFT2(",_ser1,")')"))

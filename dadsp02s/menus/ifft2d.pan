! ifft2d.pan -- 2 dimensional ifft
@b{_bg1}
@f{_fg1}
@panel
@h
IFFT2     2 Dimensional Inverse FFT 
Format:  IFFT2(matrix)
Example: IFFT2(W3)

<L>
 Input Matrix: <*            >~_DEFSER1(strcat("'","<{_frmcurr(_SER1)}>","'"))~_pickser(_ser1)
<L>
{_dwinstr}
<L>
~_mc;if(strcmp(_ser1,_dwin)==0,_DEFSER1("'curr'"))
~eval(strcat("setwf(",_dwin,",'IFFT2(",_ser1,")')"))

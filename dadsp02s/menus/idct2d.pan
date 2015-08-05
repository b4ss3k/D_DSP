! idct2d.pan -- 2 dimensional idct
@b{_bg1}
@f{_fg1}
@panel
@h
IDCT2     2 Dimensional Inverse Discrete Cosine Transform 
Format:  Idct2(matrix)
Example: Idct2(W3)

<L>
 Input Matrix: <*            >~_DEFSER1(strcat("'","<{_frmcurr(_SER1)}>","'"))~_pickser(_ser1)
<L>
{_dwinstr}
<L>
~_mc;if(strcmp(_ser1,_dwin)==0,_DEFSER1("'curr'"))
~eval(strcat("setwf(",_dwin,",'Idct2(",_ser1,")')"))

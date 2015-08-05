! dct2d.pan -- 2 dimensional dct
@b{_bg1}
@f{_fg1}
@panel
@h
DCT2     2 Dimensional Discrete Cosine Transform 
Format:  Dct2(matrix)
Example: Dct2(W3)

<L>
 Input Matrix: <*             >~_DEFSER1(strcat("'",_tocurr("<{_frmcurr(_SER1)}>"),"'"))~_pickser(_ser1)
<L>
{_dwinstr}
<L>
~_mc;if(strcmp(_ser1,_dwin)==0,_DEFSER1("'curr'"))
~eval(strcat("setwf(",_dwin,",'Dct2(",_ser1,")')"))

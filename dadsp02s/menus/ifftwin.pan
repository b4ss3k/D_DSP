! ifftwin.pan - Input IFFT parameters
@f{_fg1}
@b{_bg1}
@panel
@h
{_funcstr}
{_formatstr}
{_examplestr}

{defvar("_ifftoutf", 0);defvar("_ifftlt", 0)}

 <L>
 Input Series:        <*                  >~_DEFSER1(strcat("'","<{_frmcurr(_SER1)}>","'"))~_pickser(_ser1)
 Length:              <*                  >~_DEFLEN(_fromauto('<{_toauto(_len)}>'))~_intautolist(_LEN)
 <L>
 Output Form          <r n                >~setvar("_ifftoutf", <{_ifftoutf}>)~<Real Only><Real / Imaginary><Magnitude / Phase>
 <L>
 {_dwinstr}
 <L>
~if(strcmp(_ser1,_dwin)==0,_DEFSER1("'curr'"))
~_verifydwin(eval('_ser1'))

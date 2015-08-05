! ifft2win.pan - Input IFFT2 parameters
@f{_fg1}
@b{_bg1}
@panel
@h
{_funcstr}
{_formatstr}
{_examplestr}

{defvar("_ifft2outf", 0)}
{defvar("_rlen", "-1");defvar("_clen", "-1")}

 <L>
        Input Array: <* %                >~_DEFSER1(strcat("'","<{_frmcurr(_SER1)}>","'"))~_pickser(_ser1)
         Row Length: <* %                >~setvar("_rlen", _fromauto('<{_toauto(_rlen)}>'))~_intautolist(_rlen)
      Column Length: <* %                >~setvar("_clen", _fromauto('<{_toauto(_clen)}>'))~_intautolist(_clen)
 <L>
 Output Form         <r n  %             >~setvar("_ifft2outf", <{_ifft2outf}>)~<Real Only><Real Imaginary><Magnitude Phase>
 <L>
 {_dwinstr}
 <L>
~if(strcmp(_ser1,_dwin)==0,_DEFSER1("'curr'"))
~_verifydwin(eval('_ser1'))

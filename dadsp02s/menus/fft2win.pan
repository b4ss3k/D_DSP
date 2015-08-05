! fft2win.pan - Input FFT2 parameters
@f{_fg1}
@b{_bg1}
@panel
@h
{_funcstr}
{_formatstr}
{_examplestr}

{defvar("_fft2outf", 0);defvar("_fft2dc", 0);defvar("_fft2shift", 0)}
{defvar("_fft2win", _nonestr);defvar("_nfft2win", 0);defvar("_fft2winc", 0)}
{defvar("_rlen", "-1");defvar("_clen", "-1")}

 <L>
        Input Array: <* %                >~_DEFSER1(strcat("'","<{_frmcurr(_SER1)}>","'"))~_pickser(_ser1)
 Windowing Function: <= # n              >~setvar("_nfft2win", <{_nfft2win}>);setvar("_fft2win", _n2winfn(_nfft2win))~_lwinfun
         Row Length: <* %                >~setvar("_rlen", _fromauto('<{_toauto(_rlen)}>'))~_intautolist(_rlen)
      Column Length: <* %                >~setvar("_clen", _fromauto('<{_toauto(_clen)}>'))~_intautolist(_clen)
 <L>
 Output Form         <r n x{5} %            >~setvar("_fft2outf", <{_fft2outf}>)~<Real Imaginary><Magnitude Phase>
 Apply Windowing Amplitude Correction  <c x{-1} y{-1} % e{_fft2win != "None"} >~setvar("_fft2winc", <{_fft2winc}>)~<0><1>
            Shift Negative Frequencies <c x{-2} %       >~setvar("_fft2shift", <{_fft2shift}>)~<0><1>
                      Remove DC Offset <c % x{-2}       >~setvar("_fft2dc", <{_fft2dc}>)~<0><1>
 <L y{-2}>
 {_dwinstr}
 <L>
~if(strcmp(_ser1,_dwin)==0,_DEFSER1("'curr'"))
~_verifydwin(eval('_ser1'))

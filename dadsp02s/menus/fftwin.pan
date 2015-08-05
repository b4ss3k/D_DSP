! fftwin.pan - Input FFT parameters
@f{_fg1}
@b{_bg1}
@panel
@h
{_funcstr}
{_formatstr}
{_examplestr}

{defvar("_fftoutf", 0);defvar("_fftdc", 0);defvar("_fftshift", 0);defvar("_fftwin", _nonestr);defvar("_nfftwin", 0);defvar("_fftwinc", 0)}

 <L>
 Input Series:        <* %   w{25} t{"' Series to Operate On '"}         >~_DEFSER1(strcat("'","<{_frmcurr(_SER1)}>","'"))~_pickser(_ser1)
 Windowing Function:  <= # n w{25} t{"' Amplitude Shaping Window '"}     >~setvar("_nfftwin", <{_nfftwin}>);setvar("_fftwin", _n2winfn(_nfftwin))~_lwinfun
 Length:              <* %   w{25} t{"' Select Option or Enter a Specific Length '"}              >~_DEFLEN(_fromauto('<{_toauto(_len)}>'))~_intautolist(_LEN)
 <L>
 Output Form          <r n x{5} % t{"' Cartesian Form, Displays Real Part | Polar Form, Displays Magnitude Part '"} >~setvar("_fftoutf", <{_fftoutf}>)~<Real / Imaginary><Magnitude / Phase><>
 Windowing Correction Factor  <r n x{-1} y{-1} % e{_fftwin != "None"} t{"' No Correction Factor | Normalize the Spectrum Amplitude | Normalize the PSD RMS Value '"}>~setvar("_fftwinc", <{_fftwinc}>)~<None><Amplitude><RMS>
                      Remove DC Offset <c % w{17} t{"' Remove the Mean Value '"} >~setvar("_fftdc", <{_fftdc}>)~<0><1>
            Shift Negative Frequencies <c x{-1} y{-1} % t{"' Shift DC Value to the Midpoint '"}      >~setvar("_fftshift", <{_fftshift}>)~<0><1>
!                      Remove DC Offset <c % x{-2}       >~setvar("_fftdc", <{_fftdc}>)~<0><1>
 <L y{-2}>
 {_dwinstr}
 <L>
~if(strcmp(_ser1,_dwin)==0,_DEFSER1("'curr'"))
~_verifydwin(eval('_ser1'))

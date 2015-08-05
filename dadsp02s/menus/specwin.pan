! specwin.pan - Input a Series
@f{_fg1}
@b{_bg1}
@panel
@h
{_funcstr}
{_formatstr}
{_examplestr}

{defvar("_fftdc", 0);defvar("_fftwin", _nonestr);defvar("_nfftwin", 0);defvar("_fftwinc", 0)}

 <L>
 Input Series:        <* %   w{25} t{"' Series to Operate On '"}                    >~_DEFSER1(strcat("'","<{_frmcurr(_SER1)}>","'"))~_pickser(_ser1)
 Windowing Function:  <= # n w{25} t{"' Amplitude Shaping Window '"}     >~setvar("_nfftwin", <{_nfftwin}>);setvar("_fftwin", _n2winfn(_nfftwin))~_lwinfun
 Length:              <* %   w{25} t{"' Select Option or Enter a Specific Length '"}>~_DEFLEN(_fromauto('<{_toauto(_len)}>'))~_intautolist(_LEN)
<L>
 Windowing Correction Factor  <r n  % e{_fftwin != "None"} t{"' No Correction Factor | Normalize the Spectrum Amplitude | Normalize the PSD RMS Value '"}>~setvar("_fftwinc", <{_fftwinc}>)~<None><Amplitude><RMS>
                      Remove DC Offset <c % t{"' Remove the Mean Value '"} >~setvar("_fftdc", <{_fftdc}>)~<0><1>
 <L>
 {_dwinstr}
 <L>
~if(strcmp(_ser1,_dwin)==0,_DEFSER1("'curr'"))
~_verifydwin(eval('_ser1'))

! winfun.pan - windowing function
@f{_fg1}
@b{_bg1}
@panel
@h~help(_winfn)
{_funcstr}
{_formatstr}
{_examplestr}

{defvar("_windc", 0);defvar("_winfn", "Hamming");defvar("_nwinfn", 1);defvar("_winc", 0)}

 <L>
 Input Series:        <* % w{25} t{"' Series to Operate On '"}                    >~_DEFSER1(strcat("'","<{_frmcurr(_SER1)}>","'"))~_pickser(_ser1)
 Windowing Function:  <= # n w{25} t{"' Amplitude Shaping Window '"}     >~setvar("_nwinfn", <{_nwinfn}>);setvar("_winfn", _n2winfn(_nwinfn))~_lwinfun
 <L>
 Windowing Correction Factor  <r n x{5}     % e{_winfn != "None"} t{"' No Correction Factor | Normalize the Spectrum Amplitude | Normalize the PSD RMS Value '"}>~setvar("_winc", <{_winc}>)~<None><Amplitude><RMS>
                      Remove DC Offset <c %  t{"' Remove the Mean Value '"} >~setvar("_windc", <{_windc}>)~<0><1>
<L y{-2}>
 {_dwinstr}
 <L>
~if(strcmp(_ser1,_dwin)==0,_DEFSER1("'curr'"))
~_verifydwin(eval('_ser1'))
~_winfun(_ser1, _winfn, _winc, _windc, _dwin)

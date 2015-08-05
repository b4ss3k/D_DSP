! peak.pan - inputs a series, a real, and 2 integers
@f{_fg1}
@b{_bg1}
@panel
@h
{_funcstr}
{_formatstr}
{_examplestr}

{defvar("_padmode", 0);defvar("_padval", 0);defvar("_peaksize", "0.0")}
{defvar("_peakthresh", "0.01");defvar("_peakwidth", 1)}

 <L>
 {_serprompt  } <*     %       >~_DEFSER1(strcat("'","<{_frmcurr(_SER1)}>","'"))~_pickser(_ser1)
 {_real1prompt} <      %       >~setvar("_peakthresh", "<{_peakthresh}>") ~_INREAL("Real Number")
 {_int1prompt } <d{1}  %       >~setvar("_peakwidth",  "<{_peakwidth}>")  ~_ININT("Integer Value")
 {_int2prompt } <      %       >~setvar("_peaksize",   "<{_peaksize}>")   ~_INREAL("Real Value")
 <L>
 {_padprompt }  <r n # x{5}    >~setvar("_padmode", <{_padmode}>)~<None><Value><Envelope>
 <y{-1}>
 <>
 <>
 Pad Value      <x{-1} % e{_padmode==1}   >~setvar("_padval", <{_padval}>)~input(2)
 <L y{-2}>
 {_dwinstr}
 <L>
~if(strcmp(_ser1,_dwin)==0,_DEFSER1("'curr'"))
~_verifydwin(eval('_ser1'))
~if (_checkdwin, eval(sprintf("setwf(%s, '%s(%s, %g, %d, %g, %d, %g)')", _dwin, _peakfun, eval('_ser1'), eval('_peakthresh'), eval('_peakwidth'), eval('_peaksize'), eval('_padmode'), eval('_padval'))))

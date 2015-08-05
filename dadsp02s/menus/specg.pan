! Specg.pan - Input a Series
@f{_fg1}
@b{_bg1}
@panel
@h
{_funcstr}
{_formatstr}
{_examplestr}
{defvar("_nfwin2", 0)}
 <L>
       Input Series: <* %                >~_DEFSER1(strcat("'","<{_frmcurr(_SER1)}>","'"))~_pickser(_ser1)
     Segment Length: <#                  >~_DEFSEGLEN("<{_SEGLEN}>")~_ININT("Segment Length")
            Overlap: <                   >~_DEFOVRLAP("<{int(_SEGLEN/2)}>")~_ININT("Points to Overlap")
         FFT Length: <                   >~_DEFFFTLEN("<{_SEGLEN}>")~_ININT("FFT Length")
 Windowing Function: <= % n              >~setvar("_nfwin2", <{_nfwin2}>);defmacro("_fwin2", _n2winfn(_nfwin2), 2)~_lwinfun
 <L>
 {_dwinstr}
 <L>
~if(strcmp(_ser1,_dwin)==0,_DEFSER1("'curr'"))
~_verifydwin(eval('_ser1'))

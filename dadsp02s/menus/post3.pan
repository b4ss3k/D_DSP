! Post3.pan - postscript parameters
@f{_fg1}
@b{_bg1}
@panel
{_funcstr}
{_formatstr}
{_examplestr}

 {_str1prompt}:  <            >~defmacro("_pstitle", "<{_winform}>",2)~_INLIT("Input Title")
 {_str2prompt}:  <            >~defmacro("_psfile", "<{_psfile}>",2)~_INLIT("Input Filename")
 {_int1prompt}:  <            >~defmacro("_pcolorstr","<{_pcolorstr}>",2)~_mf("pcolor.men")

     {strcat("Current Window is W", strnum(getwnum))}
~_mc;ps(_pstitle, _psfile, _pcolor)

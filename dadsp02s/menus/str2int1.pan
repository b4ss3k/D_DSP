! Str2int1.pan - Input two strings and one integer.
@f{_fg1}
@b{_bg1}
@panel
@h
{_funcstr}
{_formatstr}
{_examplestr}

 {_str1prompt}:  <                 >~_DEFSTR1(strcat("'","<{_ptitle}>","'"))~_INSTR("Input String")
 {_str2prompt}:  <                 >~_DEFSTR2(strcat("'","<{_pfile}>","'"))~_INSTR("Input String")
 {_int1prompt}:  <                 >~defmacro("_pcolorstr","<{_pcolorstr}>",1)~_mf("pcolor.men")

      {strcat("Current Window is W", strnum(getwnum))}
~_mc;plot(_ptitle, _pfile, _pcolor)

! Str2.pan - Input two strings
@f{_fg1}
@b{_bg1}
@panel
@h
{_funcstr}
{_formatstr}
{_examplestr}
 
 {_str1prompt}:  <                  >~_DEFSTR1(strcat("'","<{_STR1}>","'"))~_INSTR("Input String")
 {_str2prompt}:  <                  >~_DEFSTR2(strcat("'","<{_STR2}>","'"))~_INSTR("Input String")

       {strcat("Current Window is W", strnum(getwnum))}
~_mc

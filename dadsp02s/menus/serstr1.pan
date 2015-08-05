! SerStr1.pan - inputs a series and a string              
@f{_fg1}
@b{_bg1}
@panel
@h
{_funcstr}
{_formatstr}
{_examplestr}
 <L>
 {_serprompt } <*             >~_DEFSER1(strcat("'","<{_frmcurr(_SER1)}>","'"))~_pickser(_ser1)
 {_str1prompt} <                      >~_DEFSTR1(strcat("'","<{_STR1}>","'"))~_INSTR("Text String")
 <L>
 {_dwinstr}
 <L>
~_mc;if(strcmp(_ser1,_dwin)==0,_DEFSER1("'curr'"))

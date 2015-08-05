! SerAsDs.pan - inputs a series and ascending/descending             
@f{_fg1}
@b{_bg1}
@panel
@h
{_funcstr}
{_formatstr}
{_examplestr}
 <L>
 {_serprompt } <*                     >~_DEFSER1(strcat("'","<{_frmcurr(_SER1)}>","'"))~_pickser(_ser1)
 <>
 {_asdsprompt} <R             >~_DEFASDS(strcat("'","<{_ASDS}>","'"))~<Ascending><Descending>
 <L>
 {_dwinstr}
 <L>
~if(strcmp(_ser1,_dwin)==0,_DEFSER1("'curr'"))
~_verifydwin(eval('_ser1'))

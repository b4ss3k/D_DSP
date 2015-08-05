! Serreal2.pan - inputs a series and two reals              
@f{_fg1}
@b{_bg1}
@panel
@h
{_funcstr}
{_formatstr}
{_examplestr}
 <L>
 {_serprompt  } <*             >~_DEFSER1(strcat("'","<{_frmcurr(_SER1)}>","'"))~_pickser(_ser1)
 {_real1prompt} <              >~_DEFREAL1(strcat("'","<{_REAL1}>","'"))~_INREAL("Value")
 {_real2prompt} <              >~_DEFREAL2(strcat("'","<{_REAL2}>","'"))~_INREAL("Value")
 <L>
 {_dwinstr}
 <L>
~if(strcmp(_ser1,_dwin)==0,_DEFSER1("'curr'"))
~_verifydwin(eval('_ser1'))

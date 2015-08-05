! SerR1I2.pan - inputs a series, a real, and 2 integers
@f{_fg1}
@b{_bg1}
@panel
@h
{_funcstr}
{_formatstr}
{_examplestr}
 <L>
 {_serprompt  } <*             >~_DEFSER1(strcat("'","<{_frmcurr(_SER1)}>","'"))~_pickser(_ser1)
 {_real1prompt} <              >~_DEFREAL1(strcat("'","<{_REAL1}>","'"))~_INREAL("Real Number")
 {_int1prompt } <              >~_DEFINT1(strcat("'","<{_INT1}>","'"))~_ININT("Integer Value")
 {_int2prompt } <              >~_DEFINT2(strcat("'","<{_INT2}>","'"))~_ININT("Integer Value")
 <L>
 {_dwinstr}
 <L>
~if(strcmp(_ser1,_dwin)==0,_DEFSER1("'curr'"))
~_verifydwin(eval('_ser1'))

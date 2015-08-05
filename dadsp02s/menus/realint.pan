! RealInt.pan - inputs a real and an integer        
@f{_fg1}
@b{_bg1}
@panel
@h
{_funcstr}
{_formatstr}
{_examplestr}
<L>
 {_real1prompt} <              >~_DEFREAL1(strcat("'","<{_REAL1}>","'"))~_INREAL("Real value")
 {_int1prompt}  <d{1}          >~_DEFINT1(strcat("'","<{_INT1}>","'"))~_ININT("Integer Value")
 <L>
 {_cwinstr}
 <L>
~_mc

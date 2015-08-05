! FXY.pan -- z = f(x,y) function evaluation
@f{_fg1}
@b{_bg1}
@panel
@{if(not(_fxyloaded), echo("Loading FXY Macros...");macread(strcat(_menuhome,"fxy.mac")))}
                          Z = F(X, Y)         
<L>
 Z = F(X, Y) :    <                            >~_DEFFXYSTR(strcat("'","<{_FXYSTR}>","'"))~_inlit2("F(x, y)",_FXYSTR)
 <L>
 X Lower     :    <              >~_DEFXL(strcat("'","<{$XL}>","'"))~_INREAL("Lower X Value")
 X Upper     :    <              >~_DEFXU(strcat("'","<{$XU}>","'"))~_INREAL("Upper X Value")
 X Increment :    <              >~_DEFXI(strcat("'","<{$XI}>","'"))~_INREAL("X Increment")
<L>
 Y Lower     :    <              >~_DEFYL(strcat("'","<{$YL}>","'"))~_INREAL("Lower Y Value")
 Y Upper     :    <              >~_DEFYU(strcat("'","<{$YU}>","'"))~_INREAL("Upper Y Value")
 Y Increment :    <              >~_DEFYI(strcat("'","<{$YI}>","'"))~_INREAL("Y Increment")
 <L>
 {_dwinstr}
 <L>

~_defzxys($XL,$XU,$XI,$YL,$YU,$YI) ;
~_verifydlen
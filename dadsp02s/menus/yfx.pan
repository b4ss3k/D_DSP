! YFX.pan -- y = f(x) function evaluation
@f{_fg1}
@b{_bg1}
@panel
@{if(not(_fxyloaded), echo("Loading FXY Macros...")|macread(strcat(_menuhome,"fxy.mac")))}
                          Y = F(X)         
 <L>
 Y = F(X)    :    <                              >~_DEFYFXSTR(strcat("'","<{_YFXSTR}>","'"))~_inlit2("F(x)",_YFXSTR)
 <L>
 X Lower     :    <              >~_DEFXL(strcat("'","<{$XL}>","'"))~_INREAL("Lower X Value")
 X Upper     :    <              >~_DEFXU(strcat("'","<{$XU}>","'"))~_INREAL("Upper X Value")
 X Increment :    <              >~_DEFXI(strcat("'","<{$XI}>","'"))~_INREAL("X Increment")

 <L>
 {_dwinstr}
 <L>

~_defyx ;_formstr = sprintf(_YFXSTR)
~_verifydlen



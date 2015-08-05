! Rand.pan -- Generate Uniformally distributed noise
@f{_fg2}
@b{_bg2}
@panel
@h
 Grandom
 <>
 Num. Points: <              >~_DEFPTS(strcat("'","<{_PTS}>","'"))~_ININT("Number of Points")
 Spacing:     <              >~_DEFSPC(strcat("'","<{_SPC}>","'"))~_INREAL("Spacing Between Points")
 <L>
 {_dwinstr}
 <L>

~_formstr = sprintf('Grandom(%s, %s)',_PTS, _SPC)
~_verifydlen


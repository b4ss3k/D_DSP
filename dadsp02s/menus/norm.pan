! Norm.pan -- Generate Normally distributed noise
@f{_fg2}
@b{_bg2}
@panel
@h
 Gnormal
<>
 Num. Points: <                         >~_DEFPTS(strcat("'","<{_PTS}>","'"))~_ININT("Number of Points")
 Spacing:     <                         >~_DEFSPC(strcat("'","<{_SPC}>","'"))~_INREAL("Spacing Between Points")
 Mean:        <                         >~_DEFMEA(strcat("'","<{_MEA}>","'"))~_INREAL("Mean Value")
 Std. Deviation: <                         >~_DEFSTV(strcat("'","<{_STV}>","'"))~_INREAL("Standard Deviation")
 <L>
 {_dwinstr}
 <L>
~_formstr = sprintf("Gnorm(%s, %s, %s, %s)", _PTS,_SPC,_MEA,_STV);
~_verifydlen

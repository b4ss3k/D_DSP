! Invhyp.pan -- Generate Signals
@f{_fg2}
@b{_bg2}
@panel
@h~help(sprintf("G%s", _gihyp))
{defvar("_gihyp", "ASINH")}

Inverse Hyperbolic
<>
 Series Type:  <%             >~setvar("_gihyp", "<{_gihyp}>")~<ASINH><ACOSH><ATANH><ASECH><ACSCH><ACOTH>
 Num. Points:  <              >~_DEFPTS(strcat("'","<{_PTS}>","'"))~_ININT("Number of Points")
 Spacing:      <              >~_DEFSPC(strcat("'","<{_SPC}>","'"))~_INREAL("Spacing Between Points")
 Frequency:    <              >~_DEFFRQ(strcat("'","<{_FRQ}>","'"))~_INREAL("Frequency of Signal")
 Phase:        <              >~_DEFPHA(strcat("'","<{_PHA}>","'"))~_INREAL("Phase of Signal")
 <L>
 {_dwinstr}
 <L>
~_MC
~_formstr = sprintf("G%s(%s, %s, %s, %s)", tolower(_gihyp),_PTS,_SPC,_FRQ,_PHA)


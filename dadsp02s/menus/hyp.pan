! Hyp.pan -- Generate Hyperbolic Series
@f{_fg2}
@b{_bg2}
@panel
@h~help(sprintf("G%s", _ghyp))
{defvar("_ghyp", "SINH")}

Hyperbolic 
<>
 Series Type:  <%             >~setvar("_ghyp", "<{_ghyp}>")~<SINH><COSH><TANH><SECH><CSCH><COTH>
 Num. Points:  <              >~_DEFPTS(strcat("'","<{_PTS}>","'"))~_ININT("Number of Points")
 Spacing:      <              >~_DEFSPC(strcat("'","<{_SPC}>","'"))~_INREAL("Spacing Between Points")
 Frequency:    <              >~_DEFFRQ(strcat("'","<{_FRQ}>","'"))~_INREAL("Frequency of Signal")
 Phase:        <              >~_DEFPHA(strcat("'","<{_PHA}>","'"))~_INREAL("Phase of Signal")
 <L>
 {_dwinstr}
 <L>

~_formstr = sprintf("G%s(%s, %s, %s, %s)", tolower(_ghyp),_PTS,_SPC,_FRQ,_PHA)
~_verifydlen


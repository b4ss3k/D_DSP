! Trig.pan -- Generate Trig Series
@f{_fg2}
@b{_bg2}
@panel
@h~help(sprintf("G%s", _gtrig))
{defvar("_gtrig", "SIN")}

Trig
<>
 Series Type:  <%             >~setvar("_gtrig", "<{_gtrig}>")~<SIN><COS><TAN><SEC><CSC><COT>
 Num. Points:  <              >~_DEFPTS(strcat("'","<{_PTS}>","'"))~_ININT("Number of Points")
 Spacing:      <              >~_DEFSPC(strcat("'","<{_SPC}>","'"))~_INREAL("Spacing Between Points")
 Frequency:    <              >~_DEFFRQ(strcat("'","<{_FRQ}>","'"))~_INREAL("Frequency of Signal")
 Phase:        <              >~_DEFPHA(strcat("'","<{_PHA}>","'"))~_INREAL("Phase of Signal")
 <L>
 {_dwinstr}
 <L>

~_formstr = sprintf("G%s(%s, %s, %s, %s)", tolower(_gtrig), _PTS, _SPC, _FRQ, _PHA)
~_verifydlen


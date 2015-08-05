! Winstuff.pan -- Generate Windowing series
@f{_fg2}
@b{_bg2}
@panel
@h~help(sprintf("G%s", _gwsig))

 {defvar("_gwsig", "HAMMING");defvar("_ngwsig", 1)}

 Windowing Functions

 <>
 Series Type:  <= % n{1}      >~setvar("_ngwsig", <{_ngwsig}>);setvar("_gwsig", _n2winfn(_ngwsig,1))~_lwinfun(0)
 Num. Points:  <              >~_DEFPTS(strcat("'","<{_PTS}>","'"))~_ININT("Number of Points")
 Spacing:      <              >~_DEFSPC(strcat("'","<{_SPC}>","'"))~_INREAL("Spacing Between Points")
<L>
{_dwinstr}
<L>

~_formstr = sprintf("G%s(%s, %s)", tolower(_gwsig), _PTS, _SPC)
~_verifydlen


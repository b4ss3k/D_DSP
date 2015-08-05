! Misc.pan -- Generate Misc Series
@f{_fg2}
@b{_bg2}
@panel
@h~help(sprintf("G%s", _gmisc))
{defvar("_gmisc", "SQRWAVE");defvar("_rst", "0.1");defvar("_pha2", "0.0")}
{defvar("_sfreq", 10);defvar("_efreq", 20)}
{if(_gmisc=="IMPULSE", _defspc(strcat("'", strnum(abs(eval(_spc))), "'")))}
{if(_gmisc=="IMPULSE" && eval(_pha2) >= eval(_PTS)*eval(_SPC), setvar("_pha2", "0.0");message(sprintf("Offset must be < %g",eval(_PTS)*eval(_SPC))))}

Misc
<>
 Series Type:  <#                     >~setvar("_gmisc", "<{_gmisc}>")~<SQRWAVE><TRIWAVE><EXP><LOG><LN><SQRT><LINE><SINC><IMPULSE><RTSQR><SWEEP>
 Num. Points:  <#                     >~_DEFPTS(strcat("'","<{_PTS}>","'"))~input(2, "Number of Points", 1)
 Spacing:      <#                     >~_DEFSPC(strcat("'","<{_SPC}>","'"))~input(1, "Delta X")
 Frequency:    <% v{_gmisc!="IMPULSE"&&_gmisc!="LINE"&&_gmisc!="SWEEP"} >~_DEFFRQ(strcat("'","<{_FRQ}>","'"))~_INREAL("Frequency of Signal")
 Slope:        <% v{_gmisc=="LINE"} y{-1} >~_DEFFRQ(strcat("'","<{_FRQ}>","'"))~_INREAL("Frequency of Signal")
 Offset:       <% v{_gmisc=="IMPULSE"} y{-1} >~setvar("_pha2", "<{_pha2}>")~input(1, 0, eval(_PTS)*eval(_SPC)-eval(_SPC))
 Start Freq:   <% v{_gmisc=="SWEEP"} y{-1} >~setvar("_sfreq", "<{_sfreq}>")~input(1, 0)
 End Freq:     <% v{_gmisc=="SWEEP"} y{-2} >~setvar("_efreq", "<{_efreq}>")~_INREAL("End Frequency")
 Offset:       <% v{_gmisc!="IMPULSE"&&_gmisc!="SWEEP"} y{-1} >~_DEFPHA(strcat("'","<{_PHA}>","'"))~input(1)
 Rise Time:    <% v{_gmisc=="RTSQR"}  >~setvar("_rst", "<{_rst}>")~_INREAL("Rise Time")
 <L>
 {_dwinstr}
 <L>

~if(_gmisc == "RTSQR",   _formstr = sprintf("G%s(%s, %s, %s, %s, %s)", tolower(_gmisc), _PTS, _SPC, _FRQ, _PHA, _rst), _formstr = sprintf("G%s(%s, %s, %s, %s)", tolower(_gmisc), _PTS, _SPC, _FRQ, _PHA))
~if(_gmisc == "IMPULSE", _formstr = sprintf("G%s(%s, %s, %s)",         tolower(_gmisc), _PTS, _SPC, _pha2))
~if(_gmisc == "SWEEP",   _formstr = sprintf("G%s(%s, %s, %s, %s)",     tolower(_gmisc), _PTS, _SPC, _sfreq, _efreq))
~_verifydlen

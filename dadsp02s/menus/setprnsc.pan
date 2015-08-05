! SetPrnSc.pan
@f{_fg1}
@b{_bg1}
@h {cnfhlp("setprnsc.hlp")}
@panel
         Screen Capture
{setvar("_pscr_mode", getconf("PRT_PRNSCREEN_MODE"))}
{setvar("_pscr_out",  getconf("PRT_PRNSCREEN_OUTPUT"))}

<>
Ctrl-P Print Screen Handler <L>
<>
Source      <r n x{5} t{'" Capture Worksheet Image | Capture Window Image | Capture Entire Application Image "'}  >~setvar("_pscr_mode", <{_pscr_mode}>)~<Worksheet><Current Window><Application>
Destination <r n x{-1} y{-1} t{'" Send Image to Clipboard | Send Image to Current Printer "'}                     >~setvar("_pscr_out",  <{_pscr_out}}>)~<Clipboard><Printer><>

~_mc;
~setconf("PRT_PRNSCREEN_MODE",   caststring(_pscr_mode))
~setconf("PRT_PRNSCREEN_OUTPUT", caststring(_pscr_out))

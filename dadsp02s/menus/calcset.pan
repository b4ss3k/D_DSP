! calcset.pan
@f{_fg1}
@b{_bg1}
!@h {cnfhlp("wksconf.hlp")}
@panel
    Calculations
<>
Calculations Enabled <c %           t{'" Enable Automatic Worksheet Formula Recalculation "'}  >~calc(<{strlen(calc)==11}>)~<0><1>
{_defsetstr}    <# b x{-1} y{-1} >~~_defcalc
<>
<L>
<>
Cyclical Window Formulae <x{5} r n # t{'" Do Not Allow Circular Window References | Prompt when Circular Window References Encountered | Enable Circular Window References without Verification "'}     >~setvar("_cycmode",'<{_cycmode}>')~<Disabled><Enabled with Verification><Enabled>
<y{-1}>
<>
<>
Iteration Count: <x{-1} y{-1} w{20} e{_cycmode!='0'} d{0} % t{'" Number of Calculation Iterations for Circular References "'}                                             >~setvar("_cyccnt", '<{_cyccnt}>')~input(2, 0, 1000)
<y{-2}>
<>
Propagate Table (F9) Edits <% x{5} y{-2} r n t{'" Do Not Recalculate Table Changes | Immediately Recalculate Table Changes | Recalculate Table Changes After Editing "'}  >~setvar("_ptabedit",'<{_ptabedit}>')~<{_nostr}><Propagate Immediately><Propagate After All Edits>

~_mc
~setconf("CYCLE_MODE",   _cycmode)
~setconf("CYCLE_COUNT",  _cyccnt)
~setconf("TABLE_UPDATE", _ptabedit)


! queryign.pan - query with ignore
@panel
@fixed_editwidth 1
@focus 1
@suppress 3 ! suppress Ok (1), suppress cancel (2)

{_queryign_title}

<i1> ! question icon
{_queryign_msg} <x{-1} y{-1}>
<>
{_queryign_ignmsg} <% c  >~setvar("_queryign_ign", <>)~<0><1>
<>
{_yesstr}     <b x{20}>~~setvar("_queryign_status", 1);        menuclear(1)
{_nostr}      <b x{-1} y{-1}>~~setvar("_queryign_status", 0);  menuclear(1)
{_cancelstr2} <b x{-1} y{-1}>~~setvar("_queryign_status", -1); menuclear(1)

~setvar("_queryign_status", 1);

! remwin.pan - windows to remove
@panel
@fixed_editwidth 0
@justifylabels 3

{setvar("_remaddcancel", 1)}
{sprintf("Remove Windows: %d Available", numwindows)}
{setvar("_numremwin", 0);defvar("_insertwin", _getcwin);defvar("_remmode", 0)}
{if(_numremwin > numwindows, setvar("_numremwin", numwindows))}

<>
 Windows To Remove: <* k x{5} v{_remmode} w{70}  >~setvar("_remwins", '<{""}>')~_winlist
 Total Number to Remove: <d{0} u{numwindows} v{_remmode==0} y{-1} w{30}>~setvar(_numremwin, <{_numremwin}>)~input(2, 0, numwindows)
 Remove Starting From: <=  v{_remmode==0} x{-1} y{-1}       w{30}>~setvar("_insertwin","<{_getcwin}>")~_winlist
 <>
 Window Selection Method <# r n x{5}        >~setvar(_remmode, <{_remmode}>)~<Specify Window Range><Choose Windows From List>

!<>
<L>

~_mc;
~setvar("_remaddcancel", 0);

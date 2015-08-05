! addwin.pan - windows to add
@panel
@fixed_editwidth 0
@justifylabels 3

{setvar("_maxaddwin", numwindows(1) - numwindows)}
{setvar("_remaddcancel", 1)}
{sprintf("Add New Windows: %d Available", _maxaddwin)}
{if(isvar("_dsaddwin"), setvar("_numaddwin", _dsaddwin),setvar("_numaddwin", 0));defvar("_insertwin", _getcwin)}
{if(_numaddwin > _maxaddwin, setvar("_numaddwin", _maxaddwin))}

<>
 Total Number to Add: <d{0} u{_maxaddwin}             w{30}     >~setvar(_numaddwin, <{_numaddwin}>)~input(2, 0, _maxaddwin)
 Insert Windows After: <=           x{-1} y{-1} w{30}   >~setvar("_insertwin","<{_getcwin}>")~_winlist
<>
<L>

~_mc;
~setvar("_remaddcancel", 0)

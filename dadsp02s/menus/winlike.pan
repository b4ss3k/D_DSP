@panel
@h~help("setwlike")


{"Set Target Window Properties Like Source Window"}
{defvar("_wlikess", 1);defvar("_wlikewc", 0)}

<>
Source Window:  <*               >~_DEFWIN(strcat("'","<{_WIN}>","'"))~_winlist
Target Windows: <* k             >~setvar("_targwins", '<{_getcwin}>')~_winlist
<>
Property Options <L>
Set Series Styles and Colors <c            >~setvar("_wlikess", <{_wlikess}>)~<0><1>
Set Window Coordinates       <c x{-1} y{-1}>~setvar("_wlikewc", <{_wlikewc}>)~<0><1>
<L>
~_mc
~eval(sprintf("setwlike(%s, %s, %d, %d)", _win, _targwins, _wlikewc, _wlikess))

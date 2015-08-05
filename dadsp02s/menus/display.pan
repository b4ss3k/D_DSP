! display.pan - select windows to display 
@panel
@fixed_editwidth 0
@justifylabels   3

@adjust_width    1
@adjust_height   1
@form

{defvar("_dispwinf", 0)}

Display Windows
<>
 Window List:      <* k x{5}                       >~setvar("_dispwins", '<{_dwinlst(",", _dispwinf)}>')~_winlist(strescape("\n"), _dispwinf)
 Show Window Title <# c x{-1} y{-1} t{"' Display Window Formula or Label '"}>~setvar("_dispwinf", <{_dispwinf}>)~<0><1>
<>

~_mc;
~if(strlen(_dispwins) > 0, eval(sprintf("Display(%s)", getwinlist(_dispwins))))

@endform

/* extract window names */
getwinlist(s)
{
	local list, wstr, i;

	list = "";
	i = 1;

	if (strlen(strfind(":", s)) > 0) {
		/* has labels */
		while (1) {
			/* ith formula with Window number */
			wstr = strget(i, s, ",");
			if (strlen(wstr) == 0) break;

			/* Window number */
			wstr = strget(1, wstr, ":");
			if (strlen(wstr) == 0) break;

			if (strlen(list) > 0) list += ",";

			list += wstr;
			i++;
		}
	}
	else {
		list = s;
	}
	return(list);
}

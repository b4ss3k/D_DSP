! rthead.pan - readt header line specification
@panel
@form

Header Lines

{if(not(menuinrefresh()), setvar("_rtcline", _rtgetcline); setvar("_rtuline", _rtgetuline))}
{defvar("_rtclinec", 1);defvar("_rtulinec", 1)}

<>
Comment Line Detection <# r n x{5} w{30} t{'" Automatically Detect and Read Comment Text | Ignore Comments | Set Specific Comment Line "'}>~ setvar(_rtcline, <{_rtcline}>)~<{_automaticstr}><Ignore><Custom>
" " <x{-1} y{-1}>
" " <x{-2}>
" " <x{-2}>
Header Line Number:   <% x{-2} d{1} e{_rtcline==2}  >~setvar("_rtclinec", <{_rtclinec}>)~input(2)
<L>
 &View                <b t{'" View File Contents "'}> ~~if(strlen(_rtfname) > 0, menureturn();viewfile(caststring(_rtfname), 1, 100, 1, 1))
 &Preview             <b x{-1} y{-1} t{'" Preview Result "'}    > ~~if(strlen(_rtfname) > 0, _prert(_rtfname, eval(_rtoffset), eval(_rtstartcol), eval(_rthex), (_rtcollist), _readt_delimiters, eval(_readt_skip_delimiters)))
<L>
Units Line Detection  <# r n x{5} w{30} t{'" Automatically Detect and Read Units Text | Ignore Units | Set Specific Units Line "'}>~       setvar(_rtuline, <{_rtuline}>)~<{_automaticstr}><Ignore><Custom>
" " <x{-1} y{-1}>
" " <x{-2}>
" " <x{-2}>
Units Line Number:    <% x{-2} d{1} e{_rtuline == 2} >~setvar("_rtulinec", <{_rtulinec}>)~input(2)

~_rtsetcline(_rtcline)
~_rtsetuline(_rtuline)

@endform


_rtsetcline(line)
{
	_rtsetline(line, "readt_comment_line");
}

_rtsetuline(line)
{
	_rtsetline(line, "readt_units_line");
}

_rtsetline(line, param)
{
	switch (line) {
		case 0:
			/* auto */
			setconf(param, "-1");
			break;

		case 1:
			/* ignore */
			setconf(param, "0");
			break;

		default:
			/* custom */
			setconf(param, caststring(line));
			break;
	}
}


_rtgetcline()
{
	local line;

	line = _rtgetline("readt_comment_line");
	return(line);
}

_rtgetuline()
{
	local line;

	line = _rtgetline("readt_units_line");
	return(line);
}


_rtgetline(param)
{
	local val;

	val = castint(getconf(param));

	switch (val) {
		case -1:
			/* auto */
			val = 0;
			break;

		case 0:
			/* ignore */
			val = 1;
			break;

		default:
			/* custom */
			break;
	}
	return(val);
}



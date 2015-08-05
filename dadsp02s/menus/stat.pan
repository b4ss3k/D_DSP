! Stat.pan - descriptive statistics, scalar result
@f{_fg1}
@b{_bg1}
@form
@panel
@h~help(sprintf("%s", _statfun))

{defvar("_statfun", "Mean")}
{if(not(menuinrefresh()),_DEFSER1(sprintf("'%s'", _getcwin)))}

Descriptive Statistics
<L>
 Function:      <# n            >~setvar("_statfun", n2stat(<{stat2n(_statfun)}>))~<Length><Max><Mean><Median><Min><Numcols><Numrows><Prod><Stdev><Stderr><Sum><RMS>
 Input Series:  <* #            >~_DEFSER1(strcat("'","<{_frmcurr(_SER1)}>","'"))~_pickser(_ser1)
<L>
 Result:        <w{30}          >~<{eval(sprintf("%s(%s)", _statfun, _ser1))}>~
<L>
~_mc
~eval(sprintf("setwf('%s(%s)')", _statfun, _ser1))


@endform

/* position to stat function name */
n2stat(n)
{
	local str;

	switch (n) {

		case 0:
		default:
			str = "Length";
			break;

		case 1:
			str = "Max";
			break;

		case 2:
			str = "Mean";
			break;

		case 3:
			str = "Median";
			break;

		case 4:
			str = "Min";
			break;

		case 5:
			str = "Numcols";
			break;

		case 6:
			str = "Numrows";
			break;

		case 7:
			str = "Prod";
			break;

		case 8:
			str = "Stdev";
			break;

		case 9:
			str = "Stderr";
			break;

		case 10:
			str = "Sum";
			break;

		case 11:
			str = "RMS";
			break;
	}
	return(str);
}


/* stat function name to position */
stat2n(stat)
{
	local n;

	switch (stat) {

		case "Length":
		default:
			n = 0;
			break;

		case "Max":
			n = 1;
			break;

		case "Mean":
			n = 2;
			break;

		case "Median":
			n = 3;
			break;

		case "Min":
			n = 4;
			break;

		case "Numcols":
			n = 5;
			break;

		case "Numrows":
			n = 6;
			break;

		case "Prod":
			n = 7;
			break;

		case "Stdev":
			n = 8;
			break;

		case "Stderr":
			n = 9;
			break;

		case "Sum":
			n = 10;
			break;

		case "RMS":
			n = 11;
			break;
	}
	return(n);
}


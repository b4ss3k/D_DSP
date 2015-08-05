! filtresp.pan - Filter Response Form
@f{_fg1}
@b{_bg1}
@panel
@form

{filtbeg()}

@h{_FILTHELP(filtmhelp(_filtfun, _filtiform))}


{_frespstr}
<>
{_ffuncstr}    <# r w{25} n{0} x{5}        t' {_ffunctip} '    > ~setvar("_filtfun",   <{_filtfun}>)             ~<{_fmagstr}><{_flogmagstr}><{_fphasestr}><{_fuphasestr}><{_fgrpdelstr}><{_fimpstr}>
{_fcoeffstr}   <# r w{25} n{0} x{-1} y{-1} t' {_fcoefftip} '   > ~setvar("_filtiform", <{_filtiform}>)           ~<{_fcoefimpstr}><{_fcoefcasstr}><{_fcoefdirstr}><><><>
{_fsigcserstr} <# c v{_filtiform==2}       t' {_fsigcsertip} ' > ~setvar("_filtrqba",  <{_filtrqba}>)            ~<0><1>
{_ffrq1mes}    <* % w{30} x{-2} y{-2}      t' {_ffrq1tip} '    > ~setvar("_filtser1",  "<{_frmcurr(_filtser1)}>") ~_pickser(_filtser1)
{_ffrq2mes}    <* % w{30} v{((_filtiform==2)&&(_filtrqba==0))} t' {_ffrq2tip} ' > ~setvar("_filtser2", "<{_frmcurr(_filtser2)}>") ~_pickser(_filtser2)
<L>
{_fnumsampstr} < w{30} d{1}                                    > ~setvar("_filtflen", <{_filtflen}>)               ~input(2)
<L>
{_dwinstrS("W30")}
<L>

~_verifydlen
~if(_chkwin>0, filtfun(_filtser1, _filtser2, _filtfun, _filtrqba, _filtflen, _filtiform, _dwin))


@endform


filtbeg()
{
	extern _filtiform, _filtrqba;

	if (not(menuinrefresh())) {
		defvar("_filtiform",  0);
		defvar("_filtfun",    0);
		defvar("_filtrqba",   1);
		defvar("_filtflen",  _deffiltflen);
		defvar("_filtser1",  _getcwin);
		defvar("_filtser2", "W1");
	}
	filter_setmes(_filtiform, _filtrqba);
}


filtonfun(fun, iform)
{
	filtsethelp(fun, ifrom);
}


filtonform(fun, iform)
{
	filtsethelp(fun, iform);
}


filter_setmes(form, raveled)
{
	setvar("_ffrq2mes", _fdenstr);
	setvar("_ffrq2tip", _fdentip);

	if (form == 0) {
		/* FIR */
		setvar("_ffrq1mes", _ffircoefstr);
		setvar("_ffrq1tip", _ffircoeftip);
	}
	else if (form == 1) {
		/* cascade */
		setvar("_ffrq1mes", _fcascoefstr);
		setvar("_ffrq1tip", _fcascoeftip);
	}
	else {
		/* direct */
		if (raveled) {
			setvar("_ffrq1mes", _fdircoefstr);
			setvar("_ffrq1tip", _fdircoeftip);
		}
		else {
			setvar("_ffrq1mes", _fnumstr);
			setvar("_ffrq1tip", _fnumtip);
		}
	}
}


filtfun(bcoef, acoef, func, isba, len, iform, dwin)
{
	local form, funcstr;

	funcstr = getfiltfun(func);

	switch (iform) {
		case 0:
		default:
			form = sprintf("%s(%s, {1}, %d)", funcstr, bcoef, len);
			break;

		case 1:
			form = sprintf("%s(%s, %d)", funcstr, bcoef, len);
			break;

		case 2:
			if (isba) {
				form = sprintf("%s(%s, %d)", funcstr, bcoef, len);
			}
			else {
				form = sprintf("%s(%s, %s, %d)", funcstr, bcoef, acoef, len);
			}
	}

	if (func == 1) {
		/* 20*log10(mag) */
		form = sprintf("20*log10(%s)", form);
	}

	if (func == 3) {
		/* unwrapped phase */
		form = sprintf("unwrap(%s)", form);
	}

	eval(sprintf("setwf(%s, '%s')", dwin, form));

}


getfiltfun(func)
{
	local form;

	switch (func) {
		case 0:
		case 1:
		default:
			/* mag */
			form = "filtmag";
			break;

		case 2:
		case 3:
			/* phase */
			form = "filtphase";
			break;

		case 4:
			/* group delay */
			form = "filtgrpdelay";
			break;

		case 5:
			/* impulse response */
			form = "filtimp";
			break;
	}

	return(form);
}




filtmhelp(fun, iform)
{
	local str;

	switch (fun) {
		case 0:
		case 1:
		default:
			/* magnitude */
			str = "filtmag";
			break;

		case 2:
			/* phase */
			str = "filtpha";
			break;

		case 3:
			/* unwrapped phase */
			str = "filtpha";
			break;

		case 4:
			/* group delay */
			str = "filtgrp";
			break;

		case 5:
			/* impulse */
			str = "filtimp";
			break;

	}
	return(str);
}

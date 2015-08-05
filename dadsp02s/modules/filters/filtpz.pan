! filtpz.pan - Filter Poles and Zeros
@f{_fg1}
@b{_bg1}
@panel
@form

{fpzbeg()}

@h{_FILTHELP(fpzmhelp(_fpzfun, _fpziform))}


{_fpzstr}
<>
{_ffuncstr}    <# r w{25} n{0} x{5}        t' {_ffunctip} '    > ~setvar("_fpzfun",   <{_fpzfun}>)             ~<{_fpzzplanestr}><{_fpzpolestr}><{_fpzzerostr}>
{_fcoeffstr}   <# r w{25} n{0} x{-1} y{-1} t' {_fcoefftip} '   > ~setvar("_fpziform", <{_fpziform}>)           ~<{_fcoefimpstr}><{_fcoefcasstr}><{_fcoefdirstr}>
{_fsigcserstr} <# c v{_fpziform==2}        t' {_fsigcsertip} ' > ~setvar("_fpzrqba",  <{_fpzrqba}>)            ~<0><1>
{_ffrq1mes}    <* w{30} x{-2} y{-2}        t' {_ffrq1tip} '    > ~setvar("_fpzser1", "<{_frmcurr(_fpzser1)}>") ~_pickser(_fpzser1)
{_ffrq2mes}    <* % w{30} v{((_fpziform==2)&&(_fpzrqba==0))} t' {_ffrq2tip} ' > ~setvar("_fpzser2", "<{_frmcurr(_fpzser2)}>") ~_pickser(_fpzser2)
<L>
{_dwinstrS("W30")}
<L>

~_verifydlen
~if(_chkwin>0, fpzpz(_fpzser1, _fpzser2, _fpzfun, _fpzrqba, _fpziform, _dwin))


@endform


fpzbeg()
{
	extern _fpziform, _fpzrqba;

	if (not(menuinrefresh())) {
		defvar("_fpziform",  0);
		defvar("_fpzfun",    0);
		defvar("_fpzrqba",   1);
		defvar("_fpzser1",  _getcwin);
		defvar("_fpzser2", "W1");
	}
	fpzer_setmes(_fpziform, _fpzrqba);
}


fpzonfun(fun, iform)
{
	fpzsethelp(fun, ifrom);
}


fpzonform(fun, iform)
{
	fpzsethelp(fun, iform);
}


fpzer_setmes(form, raveled)
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


fpzpz(bcoef, acoef, func, isba, iform, dwin)
{
	local form, funcstr;

	funcstr = getfpzfun(func);

	switch (iform) {
		case 0:
		default:
			form = sprintf("%s(%s, {1})", funcstr, bcoef);
			break;

		case 1:
			form = sprintf("%s(%s)", funcstr, bcoef);
			break;

		case 2:
			if (isba) {
				form = sprintf("%s(%s)", funcstr, bcoef);
			}
			else {
				form = sprintf("%s(%s, %s)", funcstr, bcoef, acoef);
			}
			break;
	}

	eval(sprintf("setwf(%s, '%s')", dwin, form));
}


getfpzfun(func)
{
	local form;

	switch (func) {
		case 0:
		default:
			form = "zplane";
			break;

		case 1:
			form = "filtpoles";
			break;

		case 2:
			form = "filtzeros";
			break;

	}

	return(form);
}




fpzmhelp(fun, iform)
{
	local str;

	switch (fun) {
		case 0:
		default:
			str = "zplane";
			break;

		case 1:
			str = "filtpol";
			break;

		case 2:
			str = "filtzer";
			break;
	}
	return(str);
}

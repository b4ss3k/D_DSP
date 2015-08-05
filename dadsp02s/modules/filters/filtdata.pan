! filtdata.pan - filter data panel
@f{_fg1}
@b{_bg1}
@panel
@form

! initialize form
{_filter_beg()}

! help
@h{_FILTHELP(_filtermhelp(_filtform, _ffmode))}


{_ffdatastr}
<>
{_ffinpstr}    <* # w{30}           t' {_ffinptip} '    > ~_DEFSER1(strcat("'","<{_frmcurr(_SER1)}>","'")) ~_pickser(_ser1)
<L>
{_fcoeffstr}   <# r w{30} n{0} x{5} t' {_fcoefftip} '   > ~setvar("_filtform", <{_filtform}>) ~<{_fcoefimpstr}><{_fcoefcasstr}><{_fcoefdirstr}>
{_ffmethodstr} <# r n x{-1} y{-1}   t' {_ffmethodtip} ' > ~setvar("_ffmode",   <{_ffmode}>)   ~<{_fdomainstr}><{_tdomainstr}><>

{_fsigcserstr} <# c v{_filtform==2} t' {_fsigcsertip} ' > ~setvar("_ffrqba", <{_ffrqba}>) ~<0><1>
{_ffrq1mes}    <* % w{30}           t' {_ffrq1tip} '    > ~setvar("_ffser1", "<{_frmcurr(_ffser1)}>") ~_pickser(_ffser1)
{_ffrq2mes}    <* % w{30} v{((_filtform==2)&&(_ffrqba==0))} t' {_ffrq2tip} ' > ~setvar("_ffser2", "<{_frmcurr(_ffser2)}>")~_pickser(_ffser2)
<L>
{_dwinstrS('w30')}
<L>

~_verifydlen
~if(_checkdwin, _filter_process(_ser1, _ffser1, _ffser2, _filtform, _ffmode, _ffrqba, _dwin))

@endform


_filter_beg()
{
	extern _filtform, _ffrqba;

	if (not(menuinrefresh())) {
		defvar("_filtform", 0);
		defvar("_ffrqba", 1);
		defvar("_ffmode", 0);
		defvar("_ffser1", "W1");
		defvar("_ffser2", "W1");
	}
	_filter_setmes(_filtform, _ffrqba)
}


_filter_setmes(form, raveled)
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


_filter_process(data, bcoef, acoef, method, domain, isba, dwin)
{
	switch (method) {
		case 0:
		default:
			/* FIR */
			form = (domain) ? "firfilter" : "firfilterF";
			form = sprintf("%s(%s, %s)", form, data, bcoef);
			break;

		case 1:
			/* cascade */
			form = (domain) ? "iirfilter" : "iirfilterF";
			form = sprintf("%s(%s, %s)", form, data, bcoef);
			break;

		case 2:
			/* direct */
			form = (domain) ? "filtdata" : "filtdataF";
			if (isba) {
				form = sprintf("%s(%s, %s)", form, data, bcoef);
			}
			else {
				form = sprintf("%s(%s, %s, %s)", form, data, bcoef, acoef);
			}
			break;
	}
	eval(sprintf("setwf(%s, '%s')", dwin, form));
}

_filtermhelp(iform, domain)
{
	local str;

	switch (iform) {
		case 0:
		default:
			str = "firfilt";
			break;

		case 1:
			str = "iirfilt";
			break;

		case 2:
			str = "filtdat";
			break;
	}

	if (domain == 0) {
		/* use FFT */
		str = sprintf("%sf", str);
	}

	return(str);
}

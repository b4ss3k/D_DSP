! firf.pan - menu to design FIR Filter
@panel
@form
! details
@u fir.hlp  ! details

! initialize form
{if(not(menuinrefresh()), firfiltbeg())}

! help
@h{_FILTHELP(firmhelp(_firft, _firfd))}

{_ffirdstr}

{_fftypestr}    <# w{25} n{1}                                       > ~setvar("_firft", <{_firft}>);firontype(_firft, _firfd) ~<{_ftypelpstr}><{_ftypehpstr}><{_ftypebpstr}><{_ftypebsstr}><{_ftypedfstr}><{_ftypehbstr}>
{_fdesstr}      <# w{25} n e{_firft<5} x{-1} y{-1} t' {_firmtip} '  > ~setvar("_firfd", <{_firfd}>)                           ~<{_firmkwstr}><{_firmrzstr}>
<L>
{_fratestr}     <% w{25}                           t' {_fratetip} ' > ~setvar("_firfts", <{_firfts}>)                         ~input(1)
<L>
<x{-3} y{-1} w{10} v{0}>~~
{_fcoeffstr}    <% r w{25} n{0} x{-1} y{-2} t' {_fircoeftip} '      > ~setvar("_firoform", <{_firoform}>)~<{_fcoefimpstr}><{_fcoefcasstr}><{_fcoefdirstr}>
<y{-1}>
{firlabel1(_firft)} <% w{25} y{-1}                 t' {firtip1(_firft)} '> ~setvar("_firf1", <{_firf1}>);fironf1(_firft)~input(1)
{firlabel2(_firft)} <% w{25}                       t' {firtip2(_firft)} '> ~setvar("_firf2", <{_firf2}>);fironf2(_firft)~input(1)
{firlabel3(_firft)} <% w{25} v{_firft>2&&_firft<5} t' {firtip3(_firft)} '> ~setvar("_firf3", <{_firf3}>)~input(1)
{firlabel4(_firft)} <% w{25} v{_firft>2&&_firft<5} t' {firtip4(_firft)} '> ~setvar("_firf4", <{_firf4}>)~input(1)
<L>
{_fpsrippstr}       <% w{25} e{_firfd==1&&_firft<5}                       t' {_fpassriptip} ' > ~setvar("_firfrp",<{_firfrp}>)~input(1)
{_fdcgainstr}       <% w{15} x{-1} y{-1} c e{fireunitydc(_firft, _firfd)} t' {_fudctip} '     > ~setvar("_firudc", <{_firudc}>);setvar("_firuorg", _firudc)~<0><1>
{_fsbattnstr}       <% w{25} e{_firft<5}                                  t' {_fstopatttip} ' > ~setvar("_firfrs",<{_firfrs}>)~input(1)
{_ffulllpstr}       <% w{15} x{-1} y{-1} c v{fireflp(_firft)}             t' {_firlptip} '    > ~setvar("_firflp", <{_firflp}>)~<0><1>
<L>
{_fforderstr}       <% w{25} e{_firfoaut==0} d{1}                t' {_firordertip} ' > ~setvar("_firfo", castint(_fromauto("<{_toauto(caststring(_firfo))}>")))~input(1, 0)
{_automaticstr}     <# c  x{-1} y{-1} w{1+strlen(_automaticstr)} t' {_fautotip} '    > ~setvar("_firfoaut", <{_firfoaut}>);if(_firfoaut, setvar("_firfo", -1), if(_firfo==-1, setvar("_firfo", _firforg)))~<0><1>
' {_fresdefstr} '   <# b  x{-1} y{-1} t' {_fresettip} ' >~~firfreset()
<L>
{_fqbitsstr}        <% d{1} u{64} w{25} e{_firquant} t' {_fquanttip} '  > ~setvar("_firqbits", castint(_firfrmnone("<{_firtonone(caststring(_firqbits))}>")))~input(2)
{_fqcoeffstr}       <# c x{-1} y{-1}                 t' {_fqcoefftip} ' > ~setvar("_firquant", <{_firquant}>);if(_firquant, if(_firqbits==-1, setvar("_firqbits", _firqbitsorg)),setvar("_firqbits", -1))~<0><1>
<L>
{_dwinstrS("W25")}
<L>


~_verifydlen
~fironend()
~if(_chkwin>0, firfdesign(_firft, _firfd, _firfts, _firf1, _firf2, _firf3, _firf4, _firfrp, _firfrs, _firfo, _firudc, _firflp, _firoform, _firqbits, _dwin))


@endform


firfiltbeg()
{
	extern _firfts, _firfoaut, _firforg;

	if (ismacro("_firfo")) {
		undefmacro("_firfo");
	}

	defvar("_firft",        _deffirft);
	defvar("_firfd",        _deffirfd);

	defvar("_firfts",       _deffirfts);

	defvar("_firf1",        _deffirf1);
	defvar("_firf2",        _deffirf2);
	defvar("_firf3",        _deffirf3);
	defvar("_firf4",        _deffirf4);

	defvar("_firfrp",       _deffirfrp);
	defvar("_firfrs",       _deffirfrs);

	defvar("_firforg",      _deffirforg);
	defvar("_firfoaut",     _deffirfoaut);
	defvar("_firoform",     _deffiroform);

	defvar("_firudc",       _deffirudc);
	defvar("_firuorg",      _deffiruorg);
	defvar("_firflp",       _deffirflp);

	defvar("_difff1",       _defdifff1);
	setvar("_difff2",       _defdifff2);

	defvar("_hilbf1",       _defhilbf1);
	setvar("_hilbf2",       _defhilbf2);

	defvar("_firf1org",    _deffirf1org);
	defvar("_firf2org",    _deffirf2org);
	defvar("_firf3org",    _deffirf3org);
	defvar("_firf4org",    _deffirf4org);

	setvar("_firfo", if(_firfoaut, -1, _firforg));

	/* quantization parameters */
	defvar("_firquant",     _deffirquant);
	defvar("_firqbits",     _deffirqbits);
	defvar("_firqbitsorg",  _deffirqbitsorg);

	setvar("_firqbits", if(_firquant, _firqbitsorg, -1));
}



firfreset()
{
	extern _firfts, _firfoaut, _firforg;

	if (ismacro("_firfo")) {
		undefmacro("_firfo");
	}

	setvar("_firft",        _deffirft);
	setvar("_firfd",        _deffirfd);

	setvar("_firfts",       _deffirfts);

	setvar("_firf1",        _deffirf1);
	setvar("_firf2",        _deffirf2);
	setvar("_firf3",        _deffirf3);
	setvar("_firf4",        _deffirf4);

	setvar("_firfrp",       _deffirfrp);
	setvar("_firfrs",       _deffirfrs);

	setvar("_firforg",      _deffirforg);
	setvar("_firfoaut",     _deffirfoaut);
	setvar("_firoform",     _deffiroform);

	setvar("_firudc",       _deffirudc);
	setvar("_firuorg",      _deffiruorg);
	setvar("_firflp",       _deffirflp);

	setvar("_difff1",       _defdifff1);
	setvar("_difff2",       _defdifff2);

	setvar("_hilbf1",       _defhilbf1);
	setvar("_hilbf2",       _defhilbf2);

	setvar("_firf1org",     _deffirf1org);
	setvar("_firf2org",     _deffirf2org);
	setvar("_firf3org",     _deffirf3org);
	setvar("_firf4org",     _deffirf4org);

	setvar("_firfo", if(_firfoaut, -1, _firforg));

	/* quantization parameters */
	setvar("_firquant",     _deffirquant);
	setvar("_firqbits",     _deffirqbits);
	setvar("_firqbitsorg",  _deffirqbitsorg);
}


firlabel1(mode)
{
	local str;

	switch (mode) {
		case 1:
		default:
			str = _fcutfrqstr;
			break;

		case 2:
			str = _fstopfrqstr;
			break;

		case 3:
			str = _fstop1str;
			break;

		case 4:
			str = _fpass1str;
			break;

		case 5:
			str = _fslopestr;
			break;

		case 6:
			str = _fpassstr;
			break;


	}
	return(str);
}



firlabel2(mode)
{
	local str;

	switch (mode) {
		case 1:
		default:
			str = _fsbedgestr;
			break;

		case 2:
			str = _fcutfrqstr;
			break;

		case 3:
			str = _fpbbegstr;
			break;

		case 4:
			str = _fsbbegstr;
			break;

		case 5:
			str = _fcutfrqstr;
			break;

		case 6:
			str = _fcutfrqstr;
			break;
	}
	return(str);
}

firlabel3(mode)
{
	local str;

	switch (mode) {
		case 1:
		case 2:
		case 3:
		default:
			str = _fpbendstr;
			break;

		case 4:
			str = _fsbendstr;
			break;
	}
	return(str);
}


firlabel4(mode)
{
	local str;

	switch (mode) {
		case 1:
		case 2:
		case 3:
		default:
			str = _fstop2str;
			break;

		case 4:
			str = _fpass2str;
			break;

	}
	return(str);
}



firtip1(mode)
{
	local str;

	switch (mode) {
		case 1:
		default:
			str = _flptip;
			break;

		case 2:
			str = _fhptip;
			break;

		case 3:
			str = _fbp1tip;
			break;

		case 4:
			str = _fbs1tip;
			break;

		case 5:
			str = _fdifftip;
			break;

		case 6:
			str = _fhilbtip;
			break;

	}
	return(str);
}



firtip2(mode)
{
	local str;

	switch (mode) {
		case 1:
		default:
			str = _flpsetip;
			break;

		case 2:
			str = _fhpcftip;
			break;

		case 3:
			str = _fbppbtip;
			break;

		case 4:
			str = _fbssbtip;
			break;

		case 5:
			str = _fdiffcftip;
			break;

		case 6:
			str = _fhilbpetip;
			break;

	}
	return(str);
}

firtip3(mode)
{
	local str;

	switch (mode) {
		case 1:
		case 2:
		case 3:
		default:
			str = _fbpendtip;
			break;

		case 4:
			str = _fbsendtip;
			break;
	}
	return(str);
}


firtip4(mode)
{
	local str;

	switch (mode) {
		case 1:
		case 2:
		case 3:
		default:
			str = _fbpstop2tip;
			break;

		case 4:
			str = _fbspass2tip;
			break;

	}
	return(str);
}



firmhelp(type, method)
{
	local str;

	switch (type) {

		case 1:
		default:
			str = (method) ? "lpfir" : "klp";
			break;

		case 2:
			str = (method) ? "hpfir" : "khp";
			break;

		case 3:
			str = (method) ? "bpfir" : "kbp";
			break;

		case 4:
			str = (method) ? "bsfir" : "kbs";
			break;

		case 5:
			str = "dffir";
			break;

		case 6:
			str = "hilbert";
			break;

	}
	return(str);
}


/* runs if filter type changes */
firontype(type, method)
{
	extern _firfd, _firudc, _firf1, _firf2, _difff1, _difff2, _hilbf1, _hilbf2;
	extern firf1org, firf2org, firf3org, firf4org, _firudc, _firuorg;
	local udc, val;

	if (type >= 5) {
		/* if diff or hilb, set to remez */
		_firfd = 1;

		if (type == 5) {
			/* diff */
			_firf1 = _difff1;
			_firf2 = _difff2;
		}
		else {
			/* hilbert */
			_firf1 = _hilbf1;
			_firf2 = _hilbf2;
		}
	}
	else {
		_firf1 = _firf1org;
		_firf2 = _firf2org;
	}

	(udc, val) = fireunitydc(type, method);
	if (udc) {
		_firudc = _firuorg;
	}
	else {
		_firudc = val;
	}

}


fironf1(type)
{
	extern _diff1, _hilbf1, _firf1org, _firf1;

	if (type == 5) {
		/* diff */
		_difff1 = _firf1;
	}
	else if (type == 6) {
		/* hilbert */
		_hilbf1 = _firf1;
	}
	else {
		_firf1org = _firf1;
	}
}


fironf2(type)
{
	extern _diff2, _hilbf2, _firf2org, _firf2;

	if (type == 5) {
		/* diff */
		_difff2 = _firf2;
	}
	else if (type == 6) {
		/* hilbert */
		_hilbf2 = _firf2;
	}
	else {
		_firf2org = _firf2;
	}
}



fironend()
{
	extern _firfo, _firforg;

	if (_firfo > 0) {
		_firforg = _firfo;
	}

}


fironend()
{
	extern _firfo, _firforg, _fireunitydc, _firuorg, _firft, _firfd;
	extern _firudc, _firqbits, _firqbitsorg;

	if (_firfo > 0) {
		_firforg = _firfo;
	}
	if (fireunitydc(_firft, _firfd)) {
		_firuorg = _firudc
	}
	if (_firqbits > 0) {
		_firqbitsorg = _firqbits;
	}
}



/* build fir filter design formula and execute */
firfdesign(type, method, rate, f1, f2, f3, f4, rp, attn, order, udc, flp, outform, qbits, dwin)
{
	local dstr, form, temp;

	switch (method) {
		case 0:
		default:
			form = firkaiser(type, rate, f1, f2, f3, f4, rp, attn, order, udc);
			break;

		case 1:
			form = firremez(type, rate, f1, f2, f3, f4, rp, attn, order, udc);
			break;
	}

	if (flp && fireflp(type)) {
		/* full linear phase filter */
		form = sprintf("fullfir(%s)", form);
	}


	switch (outform) {
		case 0:
		default:
			break;

		case 1:
			/* convert to cascade form */
			form = sprintf("fir2cas(%s)", form);
			break;

		case 2:
			/* convert to direct */
			form = sprintf("fir2dir(%s)", form);
			break;
	}

	if (qbits > 0) {
		/* quantize */
		form = sprintf('quantize(%s, 2^%d)', form, qbits);
	}

	eval(sprintf("setwf(%s, '%s')", dwin, form));
}


firremez(type, rate, f1, f2, f3, f4, rp, attn, order, udc)
{
	local form;

	/* filter type */
	switch (type) {
		case 1:
		default:
			form = "Lowpass(";
			if (order > 0) {
				form = sprintf("%s%d,", form, order);
			}
			form = sprintf("%s%s, %s, %s, %s, %s", form, firnum2str(rate), firnum2str(f1), firnum2str(rp), firnum2str(attn), firnum2str(f2));
			break;

		case 2:
			form = "Highpass(";
			if (order > 0) {
				form = sprintf("%s%d, ", form, order);
			}
			form = sprintf("%s%s, %s, %s, %s, %s", form, firnum2str(rate), firnum2str(f2), firnum2str(rp), firnum2str(attn), firnum2str(f1));
			break;

		case 3:
			form = "Bandpass(";
			if (order > 0) {
				form = sprintf("%s%d, ", form, order);
			}
			form = sprintf("%s%s, %s, %s, %s, %s, %s, %s", form, firnum2str(rate), firnum2str(f2), firnum2str(f3), firnum2str(rp), firnum2str(attn), firnum2str(f1), firnum2str(f4));
			break;

		case 4:
			form = "Bandstop(";
			if (order > 0) {
				form = sprintf("%s%d, ", form, order);
			}
			form = sprintf("%s%s, %s, %s, %s, %s, %s, %s", form, firnum2str(rate), firnum2str(f2), firnum2str(f3), firnum2str(rp), firnum2str(attn), firnum2str(f1), firnum2str(f4));
			break;

		case 5:
			form = "Diff(";
			if (order > 0) {
				form = sprintf("%s%d, ", form, order);
			}
			form = sprintf("%s%s, %s, %s", form, firnum2str(rate), firnum2str(f1), firnum2str(f2));
			break;

		case 6:
			form = "Hilbert(";
			if (order > 0) {
				form = sprintf("%s%d, ", form, order);
			}
			form = sprintf("%s%s, %s, %s", form, firnum2str(rate), firnum2str(f1), firnum2str(f2));
			break;
	}

	if (udc && (type == 1 || type == 4)) {
		form = sprintf('%s, "%s"', form, "unity_dc");
	}

	form = sprintf("%s)", form);

	return(form);
}


firkaiser(type, rate, f1, f2, f3, f4, rp, attn, order, udc)
{
	local form;

	/* filter type */
	switch (type) {
		case 1:
		default:
			if (order > 0) {
				form = sprintf("Kwlpass(%d, %s, %s, %s, %s", order, firnum2str(rate), firnum2str(f1), firnum2str(f2), firnum2str(attn));
			}
			else {
				form = sprintf("Kwlpass(%s, %s, %s, %s", firnum2str(rate), firnum2str(f1), firnum2str(f2), firnum2str(attn));
			}
			break;

		case 2:
			if (order > 0) {
				form = sprintf("Kwhpass(%d, %s, %s, %s, %s", order, firnum2str(rate), firnum2str(f1), firnum2str(f2), firnum2str(attn));
			}
			else {
				form = sprintf("Kwhpass(%s, %s, %s, %s", firnum2str(rate), firnum2str(f1), firnum2str(f2), firnum2str(attn));
			}
			break;

		case 3:
			if (order > 0) {
				form = sprintf("Kwbpass(%d, %s, %s, %s, %s, %s, %s", order, firnum2str(rate), firnum2str(f1), firnum2str(f2), firnum2str(f3), firnum2str(f4), firnum2str(attn));
			}
			else {
				form = sprintf("Kwbpass(%s, %s, %s, %s, %s, %s", firnum2str(rate), firnum2str(f1), firnum2str(f2), firnum2str(f3), firnum2str(f4), firnum2str(attn));
			}
			break;

		case 4:
			if (order > 0) {
				form = sprintf("Kwbstop(%d, %s, %s, %s, %s, %s, %s", order, firnum2str(rate), firnum2str(f1), firnum2str(f2), firnum2str(f3), firnum2str(f4), firnum2str(attn));
			}
			else {
				form = sprintf("Kwbstop(%s, %s, %s, %s, %s, %s", firnum2str(rate), firnum2str(f1), firnum2str(f2), firnum2str(f3), firnum2str(f4), firnum2str(attn));
			}
			break;
	}

	if (udc && (type == 1 || type == 4)) {
		form = sprintf('%s, "%s"', form, "unity_dc");
	}

	form = sprintf("%s)", form);

	return(form);
}

fireunitydc(type, method)
{
	local udc;

	udc = 0;
	val = 0;

	/* only lowpass or bandstop */
	if (type == 1 || type == 4) {
		udc = 1;
		val = 1;
	}
	if (outargc > 1) {
		return(udc, val);
	}
	else {
		return(udc);
	}
}


fireflp(type)
{
	local flp = 1;

	/* not hilbert of diff */
	if (type == 5 || type == 6) {
		flp = 0;
	}
	return(flp);
}


/* format double for filter menu - appends decimal point */
firnum2str(num)
{
	str = sprintf("%1.50g", num);
	if (strlen(strfind(".", str)) == 0) {
		str = str + ".0";
	}
	return(str);
}


_firfrmnone(s)
{
	if (strcmp(s, _nonestr) == 0) {
		return("-1");
	}
	else {
		return(s);
	}
}

_firtonone(n)
{
	if (strcmp(n, "-1") == 0) {
		return(_nonestr);
	}
	else {
		return(n);
	}
}

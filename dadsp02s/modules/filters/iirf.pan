! iirf.pan - menu to design IIR Filter
@panel
@form
!details
@u iir.hlp

! initialize form
{if(not(menuinrefresh()), iirfiltbeg())}

! help
@h{_FILTHELP(iirmhelp(_iirft, _iirfd))}


{_fiirdstr}

{_fftypestr}    <# w{25} n{1}                           > ~setvar("_iirft",   <{_iirft}>);iirontype(_iirft, _iirfd) ~<{_ftypelpstr}><{_ftypehpstr}><{_ftypebpstr}><{_ftypebsstr}>
{_fdesstr}      <# w{25} n x{-1} y{-1} t' {_iirmtip} '  > ~setvar("_iirfd",   <{_iirfd}>);iirontype(_iirft, _iirfd) ~<{_iirbutstr}><{_iircb1str}><{_iircb2str}><{_iirelpstr}><{_iirbesstr}>
<L>
{_fratestr}     <% w{25}               t' {_fratetip} ' > ~setvar("_iirfts",  <{_iirfts}>) ~input(1)
<L>
<x{-3} y{-1} w{5} aw{-1} v{0}>~~ ! spacer for alignment
{_fcoeffstr}    <% r w{15} n{1} x{-1} y{-2} t' {_iircoeftip} '  > ~setvar("_iiroform", <{_iiroform}>) ~<{_fcoefcasstr}><{_fcoefdirstr}>
{_iirtranstr}   <% r w{15} n{0} x{-1} y{-1} t' {_iirtrantip} '  > ~setvar("_iirtform", <{_iirtform}>) ~<{_iirmblstr}><{_iirmmzstr}>
<y{-1}>
{iirlabel1(_iirft)} <% w{25} y{-1}       t' {iirtip1(_iirft)} ' > ~setvar("_iirf1", <{_iirf1}>) ~input(1)
{iirlabel2(_iirft)} <% w{25}             t' {iirtip2(_iirft)} ' > ~setvar("_iirf2", <{_iirf2}>) ~input(1)
{iirlabel3(_iirft)} <% w{25} v{_iirft>2} t' {iirtip3(_iirft)} ' > ~setvar("_iirf3", <{_iirf3}>) ~input(1)
{iirlabel4(_iirft)} <% w{25} v{_iirft>2} t' {iirtip4(_iirft)} ' > ~setvar("_iirf4", <{_iirf4}>) ~input(1)
<L>
{_fpsrippstr}       <% w{25}                                              t' {_fpassriptip} ' > ~setvar("_iirfrp",<{_iirfrp}>)                              ~input(1)
{_fdcgainstr}       <% w{15} x{-1} y{-1} c e{iireunitydc(_iirft, _iirfd)} t' {_fudctip} '     > ~setvar("_iirudc", <{_iirudc}>);setvar("_iiruorg", _iirudc) ~<0><1>
{_fsbattnstr}       <% w{25}                                              t' {_fstopatttip} ' > ~setvar("_iirfrs",<{_iirfrs}>)                              ~input(1)
<L>
{_fforderstr}       <% w{25} e{_iirfoaut==0} d{1}                t' {_iirordertip} ' > ~setvar("_iirfo", castint(_fromauto("<{_toauto(caststring(_iirfo))}>")))                                            ~input(1, 0)
{_automaticstr}     <# c  x{-1} y{-1} w{1+strlen(_automaticstr)} t' {_fautotip} '    > ~setvar("_iirfoaut", <{_iirfoaut}>);if(_iirfoaut, setvar("_iirfo", -1), if(_iirfo==-1, setvar("_iirfo", _iirforg))) ~<0><1>
' {_fresdefstr} '   <# b  x{-1} y{-1} t' {_fresettip} ' >~~iirfreset()
<L>
{_fqbitsstr}        <% d{1} u{64} w{25} e{_iirquant} t' {_fquanttip} '  > ~setvar("_iirqbits", castint(_iirfrmnone("<{_iirtonone(caststring(_iirqbits))}>")))                                             ~input(2)
{_fqcoeffstr}       <# c x{-1} y{-1}                 t' {_fqcoefftip} ' > ~setvar("_iirquant", <{_iirquant}>);if(_iirquant, if(_iirqbits==-1, setvar("_iirqbits", _iirqbitsorg)),setvar("_iirqbits", -1)) ~<0><1>
<L>
{_dwinstrS("W25")}
<L>

~_verifydlen
~iironend()
~if(_chkwin>0, iirfdesign(_iirft, _iirfd, _iirfts, _iirf1, _iirf2, _iirf3, _iirf4, _iirfrp, _iirfrs, _iirfo, _iiroform, _iirudc, _iirtform, _iirqbits, _dwin))


@endform


/* initialize variables */
iirfiltbeg()
{
	extern _iirfoaut, _iirforg, _iirfd, _iirft, _iirudc, _iiruorg;
	local udc, val;

	if (ismacro("_iirfo")) {
		undefmacro("_iirfo");
	}

	defvar("_iirft",    _defiirft);
	defvar("_iirfd",    _defiirfd);

	defvar("_iirfts",   _defiirfts);

	defvar("_iirf1",    _defiirf1);
	defvar("_iirf2",    _defiirf2);
	defvar("_iirf3",    _defiirf3);
	defvar("_iirf4",    _defiirf4);

	defvar("_iirfrp",   _defiirfrp);
	defvar("_iirfrs",   _defiirfrs);

	defvar("_iirforg",  _defiirforg);
	defvar("_iirfoaut", _defiirfoaut);
	defvar("_iiroform", _defiiroform);
	defvar("_iirtform", _defiirtform);
	defvar("_iirudc",   _defiirudc);

	defvar("_iiruorg",  _defiiruorg);

	setvar("_iirfo", if(_iirfoaut, -1, _iirforg));

	/* unity dc state and value */
	(udc, val) = iireunitydc(_iirft, _iirfd);
	if (udc) {
		_iirudc = _iiruorg;
	}
	else {
		_iirudc = val;
	}

	/* quantization parameters */
	defvar("_iirquant",     _defiirquant);
	defvar("_iirqbits",     _defiirqbits);
	defvar("_iirqbitsorg",  _defiirqbitsorg);

	setvar("_iirqbits", if(_iirquant, _iirqbitsorg, -1));

}

/* reset to defaults */
iirfreset()
{
	if (ismacro("_iirfo")) {
		undefmacro("_iirfo");
	}

	setvar("_iirft",    _defiirft);
	setvar("_iirfd",    _defiirfd);

	setvar("_iirfts",   _defiirfts);

	setvar("_iirf1",    _defiirf1);
	setvar("_iirf2",    _defiirf2);
	setvar("_iirf3",    _defiirf3);
	setvar("_iirf4",    _defiirf4);

	setvar("_iirfrp",   _defiirfrp);
	setvar("_iirfrs",   _defiirfrs);

	setvar("_iirforg",  _defiirforg);
	setvar("_iirfoaut", _defiirfoaut);
	setvar("_iiroform", _defiiroform);
	setvar("_iirtform", _defiirtform);
	setvar("_iirudc",   _defiirudc);

	setvar("_iiruorg",  _defiiruorg);

	/* quantization parameters */
	setvar("_iirquant",     _defiirquant);
	setvar("_iirqbits",     _defiirqbits);
	setvar("_iirqbitsorg",  _defiirqbitsorg);

}




/* label for f1 */
iirlabel1(mode)
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
	}
	return(str);
}



/* label for f2 */
iirlabel2(mode)
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
	}
	return(str);
}


/* label for 3 */
iirlabel3(mode)
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


/* label for f4 */
iirlabel4(mode)
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


/* tip for f1 */
iirtip1(mode)
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
	}
	return(str);
}


/* tip for f2 */
iirtip2(mode)
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
	}
	return(str);
}


/* tip for f3 */
iirtip3(mode)
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


/* tip for f4 */
iirtip4(mode)
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


/* get help file name */
iirmhelp(type, method)
{
	local str;

	switch (type) {
		case 1:
		default:
			str = iirmhelp1(method);
			break;

		case 2:
			str = iirmhelp2(method);
			break;

		case 3:
			str = iirmhelp3(method);
			break;

		case 4:
			str = iirmhelp4(method);
			break;
	}

	return(str);
}


/* helpfile for LP */
iirmhelp1(method)
{
	local str;

	switch (method) {
		case 0:
		default:
			str = "blpiir";
			break;
		case 1:
			str = "c1lpiir";
			break;
		case 2:
			str = "c2lpiir";
			break;
		case 3:
			str = "elpiir";
			break;
		case 4:
			str = "bslpiir";
			break;
	}
	return(str);
}


/* helpfile for HP */
iirmhelp2(method)
{
	local str;

	switch (method) {
		case 0:
		default:
			str = "bhpiir";
			break;
		case 1:
			str = "c1hpiir";
			break;
		case 2:
			str = "c2hpiir";
			break;
		case 3:
			str = "ehpiir";
			break;
		case 4:
			str = "bshpiir";
			break;
	}
	return(str);
}


/* helpfile for BP */
iirmhelp3(method)
{
	local str;

	switch (method) {
		case 0:
		default:
			str = "bbpiir";
			break;
		case 1:
			str = "c1bpiir";
			break;
		case 2:
			str = "c2bpiir";
			break;
		case 3:
			str = "ebpiir";
			break;
		case 4:
			str = "bsbpiir";
			break;
	}
	return(str);
}


/* helpfile for BS */
iirmhelp4(method)
{
	local str;

	switch (method) {
		case 0:
		default:
			str = "bbsiir";
			break;
		case 1:
			str = "c1bsiir";
			break;
		case 2:
			str = "c2bsiir";
			break;
		case 3:
			str = "ebsiir";
			break;
		case 4:
			str = "bsbsiir";
			break;
	}
	return(str);
}



iireunitydc(type, method)
{
	local udc, val;

	udc = 0;
	val = 0;

	if (type == 1 || type == 4) {
		/* only lowpass or bandstop */
		val = 1;
		if (method == 1 || method == 3) {
			/* only cheby1 or elliptic */
			udc = 1;
		}
	}
	if (outargc > 1) {
		return(udc, val);
	}
	else {
		return(udc);
	}
}


iirontype(type, method)
{
	extern _iirudc, _iiruorg;

	(udc, val) = iireunitydc(type, method);

	if (udc) {
		_iirudc = _iiruorg;
	}
	else {
		_iirudc = val;
	}
}


iironend()
{
	extern _iirfo, _iirforg, _iireunitydc, _iiruorg, _iirft, _iirfd;
	extern _iirqbits, _iirqbitsorg;

	if (_iirfo > 0) {
		_iirforg = _iirfo;
	}
	if (iireunitydc(_iirft, _iirfd)) {
		_iiruorg = _iirudc
	}
	if (_iirqbits > 0) {
		_iirqbitsorg = _iirqbits;
	}
}




/* build iir filter design formula and execute */
iirfdesign(type, method, rate, f1, f2, f3, f4, rp, attn, order, outform, udc, tform, qbits, dwin)
{
	local dstr, form, temp;

	/* filter method */
	switch (method) {
		case 0:
			dstr = "Butterworth";
			break;

		case 1:
			dstr = "Cheby1";
			break;

		case 2:
			dstr = "Cheby2";
			temp = attn;
			attn = rp;
			rp = temp;
			break;

		case 3:
			dstr = "Elliptic";
			break;

		case 4:
			dstr = "Bessel";
			break;
	}

	if (order > 0) {
		form = sprintf("%s(%d, %d", dstr, type, order);
	}
	else {
		form = sprintf("%s(%d", dstr, type);
	}

	/* specified filter order */
	switch (type) {
		case 1:
		default:
			form = sprintf("%s, %s, %s, %s, %s, %s", form, iirnum2str(rate), iirnum2str(f1), iirnum2str(rp), iirnum2str(attn), iirnum2str(f2));
			break;

		case 2:
			form = sprintf("%s, %s, %s, %s, %s, %s", form, iirnum2str(rate), f2, iirnum2str(rp), iirnum2str(attn), iirnum2str(f1));
			break;

		case 3:
			form = sprintf("%s, %s, %s, %s, %s, %s, %s, %s", form, iirnum2str(rate), iirnum2str(f2), iirnum2str(f3), iirnum2str(rp), iirnum2str(attn), iirnum2str(f1), iirnum2str(f4));
			break;

		case 4:
			form = sprintf("%s, %s, %s, %s, %s, %s, %s, %s", form, iirnum2str(rate), iirnum2str(f1), iirnum2str(f4), iirnum2str(rp), iirnum2str(attn), iirnum2str(f2), iirnum2str(f3));
			break;
	}

	if (udc == 0) {
		if (iireunitydc(type, method)) {
			form = sprintf('%s, "non_unity_dc"', form);
		}
	}

	if (tform == 1) {
		/* matched z */
		form = sprintf('%s, "matched_z"', form);
	}

	form = sprintf("%s)", form);

	if (outform == 2) {
		/* convert to direct form */
		form = sprintf('cas2dir(%s)', form);
	}

	if (qbits > 0) {
		/* quantize */
		form = sprintf('quantize(%s, 2^%d)', form, qbits);
	}

	eval(sprintf("setwf(%s, '%s')", dwin, form));
}


/* format double for filter menu - appends decimal point */
iirnum2str(num)
{
	str = sprintf("%1.50g", num);
	if (strlen(strfind(".", str)) == 0) {
		str = str + ".0";
	}
	return(str);
}


_iirfrmnone(s)
{
	if (strcmp(s, _nonestr) == 0) {
		return("-1");
	}
	else {
		return(s);
	}
}

_iirtonone(n)
{
	if (strcmp(n, "-1") == 0) {
		return(_nonestr);
	}
	else {
		return(n);
	}
}

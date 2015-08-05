! grpdelay.pan
@f{_fg1}
@b{_bg1}
@form
@panel
@h
{_funcstr}
{_formatstr}
{_examplestr}
{_defzf(); defvar("_grpdpz", 0); defvar("_grpdlena", 1); defvar("_grpdfreqa", 1);}
{defvar("_grpdlen", 512); defvar("_grpdfrq", 1.0); defvar("_grpdba", 0)}
{_grpd_setmes(_grpdpz, _grpdba)}
<>
 Coefficient Form <#  r n  t{"' System Function in Ascending Powers of z^(-1) | Cascaded Biquad Coefficients from IIR DADiSP/Filters '"}>~setvar("_grpdpz", <{_grpdpz}>)~<Z Transform Coefficients B(z)/A(z)>~<Cascaded Biquad Coefficients>
 Single Series of Combined B(z), A(z) Terms <# c w{30} v{_grpdpz==0} t{"' Input Single Series with Combined B(z) and A(z) Coefficients as Columns '"}>~setvar("_grpdba", <{_grpdba}>)~<0><1>

 {_grpd1mes}  <* % w{30} t{_grpd1tip}>~setvar("_zfser1", "<{_frmcurr(_zfser1)}>")~_pickser(_zfser1)
 {_grpd2mes}  <* % w{30} v{_grpdpz==0&&_grpdba==0} t{_grpd2tip}>~setvar("_zfser2", "<{_frmcurr(_zfser2)}>")~_pickser(_zfser2)
<L>
 {_int1prompt}   <% d{1} w{30} t{"' Output Length '"} e{not(_grpdlena)}>~setvar("_grpdlen", <{_grpdlen}>)~input(2)
 {_int2prompt}   <# c  w{12} x{-1} y{-1} t{"' Determine Length Based on System Characteristics '"}>~setvar("_grpdlena", <{_grpdlena}>)~<0><1>
 {_real1prompt}  <%    w{30} t{"' Fs, Sample Frequency in Hertz '"} e{not(_grpdfreqa)}>~setvar("_grpdfrq", <{_grpdfrq}>)~input(1)
 {_automaticstr} <c #  w{12} x{-1} y{-1} t{"' Use Coefficient Rate '"}>~setvar("_grpdfreqa", <{_grpdfreqa}>)~<0><1>
 <L>
 {_dwinstrS("w30")}
 <L>
~if(strcmp(_zfser1,_dwin)==0,_DEFSER1("'curr'"));if(strcmp(_zfser2,_dwin)==0,_DEFSER2("'curr'"));if(strcmp(_ser3,_dwin)==0,_DEFSER3("'curr'"));
~_verifydlen
~if(_checkdwin, _grpd(_grpdpz, _grpdba, eval('_zfser1'), eval('_zfser2'), _grpdlen, _grpdlena, _grpdfrq, _grpdfreqa, _dwin))

@endform

_grpd_setmes(cascade, raveled)
{
	if (cascade == 0) {
		if (raveled) {
			setvar("_grpd1mes", "Combined B(z), A(z):");
			setvar("_grpd1tip", "'Combined B(z), A(z) Coefficients as Columns'");
		}
		else {
			setvar("_grpd1mes", "Numerator B(z):");
			setvar("_grpd2mes", "Denominator A(z):");
			setvar("_grpd1tip", "'Numerator Coefficients in Ascending Powers of z^(-1)'");
			setvar("_grpd2tip", "'Denominator Coefficients in Ascending Powers of z^(-1)'");
		}
	}
	else {
		setvar("_grpd1mes", "Cascade Coeff:");
		setvar("_grpd1tip", "'Cascaded Biquad Coefficients from IIR DADiSP/Filters'");
	}
}


/* sets formula form grpd.pan */
_grpd(mode, raveled, s1, s2, len, autolen, freq, autofreq, dwin)
{
	local form;

	if (autofreq == 0 && freq < 0) autofreq = 1;

	if (autolen) {
		if (not(autofreq)) {
			if (mode == 0) {
				if (raveled) {
					form = sprintf("grpdelay(%s, -1, %g)", s1, freq);
				}
				else {
					form = sprintf("grpdelay(%s, %s, -1, %g)", s1, s2, freq);
				}
			}
			else {
				form = sprintf("grpdelay(%s, -1, %g)", s1, freq);
			}
		}
		else {
			if (mode == 0) {
				if (raveled) {
					form = sprintf("grpdelay(%s)", s1);
				}
				else {
					form = sprintf("grpdelay(%s, %s)", s1, s2);
				}
			}
			else {
				form = sprintf("grpdelay(%s)", s1);
			}
		}
	}
	else {
		if (not(autofreq)) {
			if (mode == 0) {
				if (raveled) {
					form = sprintf("grpdelay(%s, %d, %g)", s1, len, freq);
				}
				else {
					form = sprintf("grpdelay(%s, %s, %d, %g)", s1, s2, len, freq);
				}
			}
			else {
				form = sprintf("grpdelay(%s, %d, %g)", s1, len, freq);
			}
		}
		else {
			if (mode == 0) {
				if (raveled) {
					form = sprintf("grpdelay(%s, %d)", s1, len);
				}
				else {
					form = sprintf("grpdelay(%s, %s, %d)", s1, s2, len);
				}
			}
			else {
				form = sprintf("grpdelay(%s, %d)", s1, len);
			}
		}
	}
	
	eval(sprintf("setwf(%s, '%s')", dwin, form));
}

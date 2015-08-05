! zfreq.pan
@f{_fg1}
@b{_bg1}
@panel
@form
@h
{_funcstr}
{_formatstr}
{_examplestr}
{_defzf();defvar("_zfrqm", 0);defvar("_zfrqfull", 0);defvar("_zfrqba", 0)}
{defvar("_zfs", 1.0);defvar("_zfrqauto", 1);defvar("_zfrqo", 0)}
{_zfreq_setmes(_zfrqm, _zfrqba)}
 <>
 Coefficient Form <# r n t{"' System Function in Ascending Powers of z^(-1) | Cascaded Biquad Coefficients from IIR DADiSP/Filters '"}>~setvar("_zfrqm", <{_zfrqm}>)~<Z Transform Coefficients B(z)/A(z)>~<Cascaded Biquad Coefficients>
 Single Series of Combined B(z), A(z) Terms <# c v{_zfrqm==0} t{"' Input Single Series with Combined B(z) and A(z) Coefficients as Columns '"}>~setvar("_zfrqba", <{_zfrqba}>)~<0><1>

 {_zfrq1mes}  <* % w{30} t{_zfrq1tip}>~setvar("_zfser1", "<{_frmcurr(_zfser1)}>")~_pickser(_zfser1)
 {_zfrq2mes}  <* % w{30} v{((_zfrqm==0)&&(_zfrqba==0))} t{_zfrq2tip}>~setvar("_zfser2", "<{_frmcurr(_zfser2)}>")~_pickser(_zfser2)
 <L>
 {_int1prompt}   <%  w{30} t{"' Output Length '"} d{1}>~setvar("_zfn", <{_zfn}>)~_ININT("Integer Number")
 {_chk1prompt}   <% c w{20} x{-1} y{-1} t{"' Evaluate from 0 to Fs '"}>~setvar("_zfrqfull", <{_zfrqfull}>)~<0><1>
 {_int2prompt}   <% w{30} t{"' Fs, Sample Frequency in Hertz '"} e{not(_zfrqauto)}>~setvar("_zfs", <{_zfs}>)~input(1)
 {_automaticstr} <c # w{20} x{-1} y{-1} t{"' Use Coefficient Rate '"}>~setvar("_zfrqauto", <{_zfrqauto}>)~<0><1>
 <>
 Output Format <% r n h t{"' Full Real and Complex Output | Magnitude | Log Magnitude Squared | -pi <= Phase <= pi | Unwrap Phase in Multiples of pi '"}>~setvar("_zfrqo", <{_zfrqo}>)~<Complex><Magnitude><20*log10(Mag)><Phase><Unwrapped Phase>
 {_dwinstrS("w30")}
 <L>
~if(strcmp(_zfser1,_dwin)==0,_DEFSER1("'curr'"));if(strcmp(_zfser2,_dwin)==0,_DEFSER2("'curr'"))
~_verifydlen
~if(_checkdwin, _zfreq(_zfrqm, _zfrqba, eval('_zfser1'), eval('_zfser2'), _zfn, _zfs, _zfrqauto, _zfrqfull, _zfrqo, _dwin))

@endform

_zfreq_setmes(cascade, raveled)
{
	if (cascade == 0) {
		if (raveled) {
			setvar("_zfrq1mes", "Combined B(z), A(z):");
			setvar("_zfrq1tip", "'Combined B(z), A(z) Coefficients as Columns'");
		}
		else {
			setvar("_zfrq1mes", "Numerator B(z):");
			setvar("_zfrq2mes", "Denominator A(z):");
			setvar("_zfrq1tip", "'Numerator Coefficients in Ascending Powers of z^(-1)'");
			setvar("_zfrq2tip", "'Denominator Coefficients in Ascending Powers of z^(-1)'");
		}
	}
	else {
		setvar("_zfrq1mes", "Cascade Coeff:");
		setvar("_zfrq1tip", "'Cascaded Biquad Coefficients from IIR DADiSP/Filters'");
	}
}

	
_zfreq(mode, raveled, s1, s2, len, freq, autofreq, full, outmode, dwin)
{
	local form;

	if (autofreq == 0 && freq < 0) autofreq = 1;

	if (not(autofreq)) {
		if (mode == 0) {
			if (full) {
				if (raveled) {
					form = sprintf("zfreq(%s, %d, %g, 1)", s1, len, freq);
				}
				else {
					form = sprintf("zfreq(%s, %s, %d, %g, 1)", s1, s2, len, freq);
				}
			}
			else {
				if (raveled) {
					form = sprintf("zfreq(%s, %d, %g)", s1, len, freq);
				}
				else {
					form = sprintf("zfreq(%s, %s, %d, %g)", s1, s2, len, freq);
				}
			}
		}
		else {
			if (full) {
				form = sprintf("zfreq(%s, %d, %g, 1)", s1, len, freq);
			}
			else {
				form = sprintf("zfreq(%s, %d, %g)", s1, len, freq);
			}
		}
	}
	else {
		if (mode == 0) {
			if (full) {
				if (raveled) {
					form = sprintf("zfreq(%s, %d, -1, 1)", s1, len);
				}
				else {
					form = sprintf("zfreq(%s, %s, %d, -1, 1)", s1, s2, len);
				}
			}
			else {
				if (raveled) {
					form = sprintf("zfreq(%s, %d)", s1, len);
				}
				else {
					form = sprintf("zfreq(%s, %s, %d)", s1, s2, len);
				}
			}
		}
		else {
			if (full) {
				form = sprintf("zfreq(%s, %d, -1, 1)", s1, len);
			}
			else {
				form = sprintf("zfreq(%s, %d)", s1, len);
			}
		}
	}
	switch (outmode) {
		case 0:
		default:
			break;

		case 1:
			form = sprintf("mag(%s)", form);
			break;

		case 2:
			form = sprintf("20*log10(mag(%s))", form);
			break;

		case 3:
			form = sprintf("phase(%s)", form);
			break;

		case 4:
			form = sprintf("unwrap(phase(%s))", form);
			break;
	}

	eval(sprintf("setwf(%s, '%s')", dwin, form));
}

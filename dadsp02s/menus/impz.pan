! impz.pan - inputs 3 series 
@f{_fg1}
@b{_bg1}
@form
@panel
@h
{_funcstr}
{_formatstr}
{_examplestr}
{_defzf(); defvar("_impzpz", 0); defvar("_impzlena", 1); defvar("_impzfreqa", 1);}
{defvar("_impzlen", 10); defvar("_impzfrq", 1.0); defvar("_impzstyle", 6);defvar("_impzba", 0)}
{_impz_setmes(_impzpz, _impzba)}
<>
 Coefficient Form <#  r n  t{"' System Function in Ascending Powers of z^(-1) | Cascaded Biquad Coefficients from IIR DADiSP/Filters '"}>~setvar("_impzpz", <{_impzpz}>)~<Z Transform Coefficients B(z)/A(z)>~<Cascaded Biquad Coefficients>
 Single Series of Combined B(z), A(z) Terms <# c w{30} v{_impzpz==0} t{"' Input Single Series with Combined B(z) and A(z) Coefficients as Columns '"}>~setvar("_impzba", <{_impzba}>)~<0><1>

 {_impz1mes}  <* % w{30} t{_impz1tip}>~setvar("_zfser1", "<{_frmcurr(_zfser1)}>")~_pickser(_zfser1)
 {_impz2mes}  <* % w{30} v{_impzpz==0&&_impzba==0} t{_impz2tip}>~setvar("_zfser2", "<{_frmcurr(_zfser2)}>")~_pickser(_zfser2)
<L>
 {_int1prompt}   <% d{1} w{30} t{"' Output Length '"} e{not(_impzlena)}>~setvar("_impzlen", <{_impzlen}>)~input(2)
 {_int2prompt}   <# c  w{12} x{-1} y{-1} t{"' Determine Length Based on System Characteristics '"}>~setvar("_impzlena", <{_impzlena}>)~<0><1>
 {_real1prompt}  <%    w{30} t{"' Fs, Sample Frequency in Hertz '"} e{not(_impzfreqa)}>~setvar("_impzfrq", <{_impzfrq}>)~input(1)
 {_automaticstr} <c #  w{12} x{-1} y{-1} t{"' Use Coefficient Rate '"}>~setvar("_impzfreqa", <{_impzfreqa}>)~<0><1>
 <L>
  Plot Style: <% x{5} n w{30} t{"' Output Plot Style '"}>  ~setvar("_impzstyle",<{_impzstyle}>)~<Lines><Points><Sticks><Bars><Table View><Steps><Stem>
 <L>
 {_dwinstrS("w30")}
 <L>
~if(strcmp(_zfser1,_dwin)==0,_DEFSER1("'curr'"));if(strcmp(_zfser2,_dwin)==0,_DEFSER2("'curr'"));if(strcmp(_ser3,_dwin)==0,_DEFSER3("'curr'"));
~_verifydlen
~if(_checkdwin, _impz(_impzpz, _impzba, eval('_zfser1'), eval('_zfser2'), _impzlen, _impzlena, _impzfrq, _impzfreqa, castint(_stplst(_impzstyle)), _dwin))

@endform

_impz_setmes(cascade, raveled)
{
	if (cascade == 0) {
		if (raveled) {
			setvar("_impz1mes", "Combined B(z), A(z):");
			setvar("_impz1tip", "'Combined B(z), A(z) Coefficients as Columns'");
		}
		else {
			setvar("_impz1mes", "Numerator B(z):");
			setvar("_impz2mes", "Denominator A(z):");
			setvar("_impz1tip", "'Numerator Coefficients in Ascending Powers of z^(-1)'");
			setvar("_impz2tip", "'Denominator Coefficients in Ascending Powers of z^(-1)'");
		}
	}
	else {
		setvar("_impz1mes", "Cascade Coeff:");
		setvar("_impz1tip", "'Cascaded Biquad Coefficients from IIR DADiSP/Filters'");
	}
}


/* sets formula form impz.pan */
_impz(mode, raveled, s1, s2, len, autolen, freq, autofreq, style, dwin)
{
	local form;

	if (autofreq == 0 && freq < 0) autofreq = 1;

	if (autolen) {
		if (not(autofreq)) {
			if (mode == 0) {
				if (raveled) {
					form = sprintf("impz(%s, -1, %g)", s1, freq);
				}
				else {
					form = sprintf("impz(%s, %s, -1, %g)", s1, s2, freq);
				}
			}
			else {
				form = sprintf("impz(%s, -1, %g)", s1, freq);
			}
		}
		else {
			if (mode == 0) {
				if (raveled) {
					form = sprintf("impz(%s)", s1);
				}
				else {
					form = sprintf("impz(%s, %s)", s1, s2);
				}
			}
			else {
				form = sprintf("impz(%s)", s1);
			}
		}
	}
	else {
		if (not(autofreq)) {
			if (mode == 0) {
				if (raveled) {
					form = sprintf("impz(%s, %d, %g)", s1, len, freq);
				}
				else {
					form = sprintf("impz(%s, %s, %d, %g)", s1, s2, len, freq);
				}
			}
			else {
				form = sprintf("impz(%s, %d, %g)", s1, len, freq);
			}
		}
		else {
			if (mode == 0) {
				if (raveled) {
					form = sprintf("impz(%s, %d)", s1, len);
				}
				else {
					form = sprintf("impz(%s, %s, %d)", s1, s2, len);
				}
			}
			else {
				form = sprintf("impz(%s, %d)", s1, len);
			}
		}
	}
	
	eval(sprintf("setwf(%s, '%s')", dwin, form));
	eval(sprintf("setplotstyle(%s, %d)", dwin, style));
}

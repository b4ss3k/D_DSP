! zplane.pan - inputs 3 series 
@f{_fg1}
@b{_bg1}
@panel
@form
@h
{_funcstr}
{_formatstr}
{_examplestr}
{_defzf(); defvar("_zplnpz", 0);defvar("_zplngain", 1.0);defvar("_zplnba", 0)}
{_zpln_setmes(_zplnpz, _zplnba)}
<>
 Zplane Inputs <#  r n  t{"' System Function in Ascending Powers of z^(-1) | Cascaded Biquad Coefficients from IIR DADiSP/Filters | Direct Zeros, Poles and Gain Values '"}>~setvar("_zplnpz", <{_zplnpz}>)~<Z Transform Coefficients B(z)/A(z)>~<Cascaded Biquad Coefficients><Zeros Poles Gain>
 Single Series of Combined B(z), A(z) Terms <# c w{30} v{_zplnpz==0} t{"' Inpute Single Series with Combined B(z) and A(z) Coefficients as Columns '"}>~setvar("_zplnba", <{_zplnba}>)~<0><1>
 {_zpln1mes}  <* % w{30} t{_zpln1tip}>~setvar("_zfser1", "<{_frmcurr(_zfser1)}>")~_pickser(_zfser1)
 {_zpln2mes}  <* % w{30} v{(_zplnpz==2)||(_zplnpz==0&&_zplnba==0)} t{_zpln2tip}>~setvar("_zfser2", "<{_frmcurr(_zfser2)}>")~_pickser(_zfser2)
 "                       Gain" <% w{30} v{_zplnpz==2} t{"' System Gain '"} >~setvar("_zplngain", <{_zplngain}>)~input(1)
 <L>
 {_dwinstrS("w30")}
 <L>
~if(strcmp(_zfser1,_dwin)==0,_DEFSER1("'curr'"));if(strcmp(_zfser2,_dwin)==0,_DEFSER2("'curr'"));if(strcmp(_ser3,_dwin)==0,_DEFSER3("'curr'"));
~_verifydlen
~if(_checkdwin, _zplane(eval('_zfser1'), eval('_zfser2'), _zplngain, _zplnpz, _zplnba, _dwin))

@endform

_zpln_setmes(mode, raveled)
{
	if (mode == 1) {
		setvar("_zpln1mes", "       Cascade Coeff:");
		setvar("_zpln1tip", "'Cascaded Biquad Coefficients from IIR DADiSP/Filters'");
	}
	else if (mode == 2) {
		setvar("_zpln1mes", "Zeros:");
		setvar("_zpln2mes", "Poles:");
		setvar("_zpln1tip", "'Zero Values'");
		setvar("_zpln2tip", "'Pole Values'");
	}
	else {
		if (raveled) {
			setvar("_zpln1mes", "Combined B(z), A(z):");
			setvar("_zpln1tip", "'Combined B(z), A(z) Coefficients as Columns'");
		}
		else {
			setvar("_zpln1mes", "Numerator B(z):");
			setvar("_zpln2mes", "Denominator A(z):");
			setvar("_zpln1tip", "'Numerator Coefficients in Ascending Powers of z^(-1)'");
			setvar("_zpln2tip", "'Denominator Coefficients in Ascending Powers of z^(-1)'");
		}
	}

}
	

/* sets formula form zplane.pan */
_zplane(s1, s2, r1, pzmode, raveled, dwin)
{
	local form;

	if (pzmode == 1) {
		/* cascade input */
		form = sprintf("zplane(%s)", s1);
	}
	else if (pzmode == 2) {
		/* z, p, g */
		form = sprintf("zplane(%s, %s, %d)", s1, s2, r1);
	}
	else {
		/* B(z), A(z) */
		if (raveled) {
			form = sprintf("zplane(%s)", s1);
		}
		else {
			form = sprintf("zplane(%s, %s)", s1, s2);
		}
	}
	eval(sprintf("setwf(%s, '%s')", dwin, form));
}

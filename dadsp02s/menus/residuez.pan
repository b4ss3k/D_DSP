! residuez.pan - inputs 3 series 
@f{_fg1}
@b{_bg1}
@form
@panel
{_funcstr}
{_formatstr}
{_examplestr}
{_defzf(); defvar("_residzsd", 0);defvar("_residzrpd", 0);defvar("_residzsw", 0);defvar("_residzdt", 0)}
{_defresidz_mes()}
@h~{_residzhlp}
<>
{if(_residzdt, setvar("_zfser3", _residz_empty()))}
 Domain          <# r n t{"' Digital System Function in Ascending Powers of z^(-1) | Analog System Function in Ascending powers of s '"}>~setvar("_residzsd", <{_residzsd}>)~<Discrete Z Transform B(z)/A(z)>~<Continuous S Transform B(s)/A(s)>
 Residuez Inputs <# v{not(_residzsd)}  r n t{"' Discrete System Function in Ascending Powers of z^(-1) | Inverse Residue, Residues, Poles and Direct Terms '"}>~setvar("_residzrpd", <{_residzrpd}>)~<Z Transform B(z)/A(z)>~<Residues, Poles, Direct Terms>
 Residue Inputs  <# y{-3} v{_residzsd} r n t{"' Continuous System Function in Ascending Powers of s | Inverse Residue, Residues, Poles and Direct Terms '"}>~setvar("_residzrpd", <{_residzrpd}>)~<S Transform B(s)/A(s)>~<Residues, Poles, Direct Terms>
 Single Series of Combined Residue, Pole and Direct Terms <# w{40} c v{_residzrpd} t{"' Input Single Series with Combined Residues, Poles and Direct Terms as Columns '"}>~setvar("_residzsw", <{_residzsw}>)~<0><1>
 {_residz1mes} <* % w{30} t{_residz1tip}>~setvar("_zfser1", "<{_frmcurr(_zfser1)}>")~_pickser(_zfser1)
 {_residz2mes} <* % w{30} v{not(_residzrpd)||_residzrpd&&not(_residzsw)} t{_residz2tip}>~setvar("_zfser2", "<{_frmcurr(_zfser2)}>")~_pickser(_zfser2)
 "     Direct Terms"  <* % w{30} e{not(_residzdt)} v{_residzrpd&&not(_residzsw)} t{"' Partial Fraction Direct Terms in Ascending Powers of s or z^(-1) '"} >~setvar("_zfser3", "<{_frmcurr(_zfser3)}>")~_pickser(_zfser3)
 No Terms <# w{10} c x{-1} y{-1} w{10} v{_residzrpd&&not(_residzsw)} t{"' Set to Empty Series '"}>~setvar("_residzdt", <{_residzdt}>)~<0><1>
 <L>
 {_dwinstrS("w30")}
 <L>
~if(strcmp(_zfser1,_dwin)==0,_DEFSER1("'curr'"));if(strcmp(_zfser2,_dwin)==0,_DEFSER2("'curr'"));if(strcmp(_ser3,_dwin)==0,_DEFSER3("'curr'"));
~_verifydlen
~if(_checkdwin, _residz(eval('_zfser1'), eval('_zfser2'), eval('_zfser3'), _residzrpd, _residzsw, _residzsd, _dwin))

@endform

// SPL Code

_defresidz_mes()
{
	if (_residzrpd) {
		if (_residzsw) {
			setvar("_residz1mes", "Combined R, P, K:");
			setvar("_residz1tip", "' Single Series with Combined Residues, Poles and Direct Terms as Columns '");
		}
		else {
			setvar("_residz1mes", "Residues:");
			setvar("_residz1tip", "' Residue Values '");
		}
		setvar("_residz2mes", "Poles:");
		setvar("_residz2tip", "' Pole Values '");
	}
	else {
		if (_residzsd) {
			setvar("_residz1mes", "Numerator B(s):");
			setvar("_residz2mes", "Denominator A(s):");
			setvar("_residz1tip", "'Numerator Coefficients in Ascending Powers of s'");
			setvar("_residz2tip", "'Denominator Coefficients in Ascending Powers of s'");
		}
		else {
			setvar("_residz1mes", "Numerator B(z):");
			setvar("_residz2mes", "Denominator A(z):");
			setvar("_residz1tip", "'Numerator Coefficients in Ascending Powers of z^(-1)'");
			setvar("_residz2tip", "'Denominator Coefficients in Ascending Powers of z^(-1)'");
		}
	}
	if (_residzsd) {
		setvar("_residz3tip", "' Continuous System Function in Ascending Powers of s | Inverse Residue, Residues, Poles and Direct Terms '");
		setvar("_residzhlp", "help('Residue')");
	}
	else {
		setvar("_residz3tip", "' Discrete System Function in Ascending Powers of z^(-1) | Inverse Residue, Residues, Poles and Direct Terms '");
		setvar("_residzhlp", "help('Residuez')");
	}

}

_residz_empty()
{
	return("{}");
}


/* sets formula form residuez.pan */
_residz(s1, s2, s3, rpd, single, sdomain, dwin)
{
	local func, form;

	func = (sdomain) ? "Residue" : "Residuez";

	if (rpd) { /* inverse residuez function */
		if (single) { /* single series */
			form = sprintf("%s(%s)", func, s1);
		}
		else {
			form = sprintf("%s(%s, %s, %s)", func, s1, s2, s3);
		}
	}
	else {
		form = sprintf("%s(%s, %s)", func, s1, s2);
	}
	
	eval(sprintf("setwf(%s, '%s')", dwin, form));
}

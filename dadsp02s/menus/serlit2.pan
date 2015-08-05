! Serlit2.pan - inputs a series and two literals
@f{_fg1}
@b{_bg1}
@panel
@form
@h~help(_replhlpstr)

{replace_beg()} 

{_funcstr}
{_formatstr}
{_examplestr}

<L>
 {_serprompt } <* w{35}                 t' {_repltip1} '  >~_DEFSER1(strcat("'","<{_frmcurr(_SER1)}>","'"))~_pickser(_ser1)
<L>
 {_str1prompt} <  w{35}                 t' {_repltip2} '  >~setvar("_lit1v", '<{_lit1v}>')~_INLIT("Literal")
 {_str2prompt} <  w{35} e{_replintp==0} t' {_repltip3} '  >~setvar("_lit2v", '<{_lit2v}>')~_INLIT("Literal")
 {_str3prompt} <c # w{18} x{-1} y{-1}   t' {_repltip4} '  >~setvar("_replintp", <{_replintp}>)~<0><1>
<L>
 {_dwinstrS("w35")}
 {_str4prompt} <c   w{18} x{-1} y{-1} v{_replintp==1} t' {_repltip5} ' >~setvar("_replendpt", <{_replendpt}>)~<0><1>
<L>
~if(strcmp(_ser1,_dwin)==0,_DEFSER1("'curr'"))
~_verifydwin(eval('_ser1'))
~ if(_checkdwin, replacefun(_ser1, _lit1v, _lit2v, _replintp, _replendpt, _dwin))

@endform


/* initialize input parameters */
replace_beg()
{
	extern _replintp, _replhlpstr;

	defvar("_replintp", 0);
	defvar("_replendpt", 1);

	if (_replintp) {
		_replhlpstr = "Outlier";
	}
	else {
		_replhlpstr = "Replace";
	}

	replace_tips();

}


/* tip strings */
replace_tips()
{
	defvar("_repltip1", "Input Series");
	defvar("_repltip2", "Outlier Condition - a Binary Series");
	defvar("_repltip3", "Numeric Replacement Value");
	defvar("_repltip4", "Replace Removed Outliers with the Linear Interpolation of Preserved Values");
	defvar("_repltip5", "Replace Removed Beginning and End Points with First and Last Preserved Values");
}


/* set REPLACE or OUTLIER */
replacefun(ser1, lit1v, lit2v, interp, endpt, dwin)
{
	local form;

	if (interp) {
		form = sprintf("outlier(%s, %s", ser1, lit1v);
		if (endpt == 0) {
			form = sprintf("%s, 0", form);
		}
		form = sprintf("%s)", form);
	}
	else {
		form = sprintf("replace(%s, %s, %s)", ser1, lit1v, lit2v);
	}

	eval(sprintf('setwf(%s, "%s")', dwin, form));
}


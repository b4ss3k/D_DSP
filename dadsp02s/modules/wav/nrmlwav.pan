! nrmlwav.pan
@panel
@form
@h ~help('Normalizing DADiSP Data',strcat(_WAVHOME, 'dspwav.hlp'))

{defvar("_wavbitsmode", 0);defvar("_wavbitsoff", 0);defvar("_wavbitsofforig", _wavbitsoff)}
{defvar("_wavbitscust", _wavbits); defvar("_wavbitscustorig", _wavbits)}
{defvar("_wavoff", 0)}

         Normalize Data 

WAV Data:        <% * w{35} t{"' Series to Normalize '"} >~setvar("_wavwin","<{_frmcurr(_wavwin)}>")~_pickser(_wavwin)
<L>
Bits Per Sample  <# x{5} r n t{"' Quantize from 0 to 255 | Quantize from -32768 to 32767 | Custom Number of Quantization Bits '"} >~setvar("_wavbitsmode",<{_wavbitsmode}>);wavonbits()~<8><16><Custom>
Bit Offset       <% x{-1} y{-1} r n e{_wavbitsmode==2} t{wavofftip(_wavbitscust)} >~setvar("_wavbitsoff", <{_wavbitsoff}>);setvar("_wavbitsofforig", _wavbitsoff)~<Unsigned><Signed><>
<>
Custom Bits:     <# w{15} d{1} e{_wavbitsmode==2} t{"' Custom Number of Quantization Bits '"} >~setvar("_wavbitscust", <{_wavbitscust}>);setvar("_wavbitscustorig", _wavbitscust)~input(2)
<y{-2}>
<L>
{_dwinstrS("w30")}
<L>

~_verifydlen
~if(_checkdwin, setwavbits())
~if(_checkdwin, setwavform())

@endform

setwavbits()
{
	extern _wavbitsmode, _wavbitscust, _wavbitscustorig, _wavbits;
	extern _wavbitsoff, _wavoff, _wavbitsofforig;

	switch (_wavbitsmode) {
		case 0:
		default:
			_wavbits = 8;
			_wavoff  = 0;
			break;

		case 1:
			_wavbits = 16;
			_wavoff  = 1;
			break;

		case 2:
			/* custom */
			_wavbits = _wavbitscust;
			_wavbitscustorig = _wavbits;

			_wavoff = _wavbitsoff;
			_wavbitsofforig = _wavoff;
			break;
	}
}


wavonbits()
{
	extern _wavbitsmode, _wavbitscust, _wavbitscustorig, _wavbits;
	extern _wavbitsoff,  _wavbitsofftorig;

	switch (_wavbitsmode) {
		case 0:
		default:
			_wavbitscust = 8;
			_wavbitsoff  = 0;
			break;

		case 1:
			_wavbitscust = 16;
			_wavbitsoff  = 1;
			break;

		case 2:
			/* custom */
			_wavbitscust = _wavbitscustorig;
			_wavbitsoff  = _wavbitsofforig;
			break;
	}
}

wavofftip(bits)
{
	local str;

	str = sprintf('" Unsigned Output from 0 to %d | Signed Output from %d to %d "', 
		castint(2^bits - 1), castint(-(2^(bits-1))), castint(2^(bits-1)-1));

	return(str);
}


setwavform()
{
	local form;
	extern _wavbits, _wavwin, _wavoff;

	if (eval(sprintf("length(%s)", _wavwin)) <= 0) {
		error("Normalize - series required");
	}

	form = sprintf("Normalize(%s, %d", _wavwin, _wavbits);

	if (not((_wavbits == 8 && _wavoff == 0) || (_wavbits == 16 && _wavoff == 1))) {
		form = sprintf("%s, %d)", form, _wavoff);
	}
	else {
		form = sprintf("%s)", form);
	}
	eval(sprintf("setwf(%s, '%s')", _dwin, form));
}

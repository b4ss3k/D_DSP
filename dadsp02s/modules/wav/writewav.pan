! WriteWav.pan
@x10
@y0
@panel
@form
@justifylabels 3
@h ~help('Writing a WAV File',strcat(_WAVHOME, 'dspwav.hlp'))

{defvar("_wavfname", getlabpath + "dadisp.wav")}
{_wwavbeg(_wavfname)}


         Write Series as WAV File
<>
 &File Name: <* % w{85} t"{_wavfname}" >~setvar("_wavfname", '<{getvar("_wavfname")}>')~pickflst(_wavfname, "_wavnamelst")
 &Browse...  <b # x{-1} y{-1} t{"' Select New File '"} > ~~if(strlen(temp = Pickfile(_wavpickdir,"Select WAV File",strescape("WAV Files(*.wav)\0*.wav\0All Files(*.*)\0*.*\0\0"),2)) > 0, setvar("_wavfname", temp);setvar("_wavpickdir", strrev(strfind(pathchar, strrev(_wavfname)))))
<L>
{_wwavlabel(_wwavmode)}        <# * w{35} y{-2} t"{_wwavtip(_wwavmode)}" >~setvar("_wavwin","<{_frmcurr(_wavwin)}>")~_pickser(_wavwin)
Right Channel WAV Data:        <% * w{35} x{-1} y{-1} v{_wwavmode!=0} t{"' Series for Right Channel WAV Output '"} >~setvar("_rwavwin","<{_frmcurr(_rwavwin)}>")~_pickser(_rwavwin)
<L>
Channel Mode                   <# r n  x{5} t{"' Single Channel for WAV Output | 2 Channels for WAV Output '"}  >~setvar("_wwavmode", <{_wwavmode}>)~<Mono><Stereo>
Bits Per Sample                <% r    x{-1} y{-1} t{"' 8 Bit Resolution per Sample | 16 Bit Resolution per Sample '"} > ~setvar("_wavbits",<{_wavbits}>)~<8><16>
Portion to Write               <% r n  x{-1} y{-1} t{"' Write Entire Series | Write Displayed Section of Series '"}       >~setvar("_wdisp",<{_wdisp}>)~<Entire><Displayed>
Sample Rate:                   <% *  w{35} y{-2} t{"' Sample Rate for WAV Data '"}   > Hz     ~setvar("_wavsrate",<{_wwavrate()}>)~<11025><22050><44100>
Autoscale Input Series         <% c x{-1} y{-1} t{"' Automatically Scale Input Series to Conform to Bits Per Sample '"}>~setvar("_wwavscale", <{_wwavscale}>)~<0><1>
<L>

~if(_wwavwrite(_wwavmode) == 0, menureturn())
~_wwavend

@endform


_wwavbeg(fname)
{
	/* set default name to appear in dialog box */
	if (argc > 0 && strlen(fname) > 0) {
		/* use input filename */
		setvar("_wavfname", fname);
		setvar("_wavpickdir", strrev(strfind(pathchar, strrev(_wavfname))));
	}
	else {
		/* just define the variable */
		defvar("_wavfname", "");
	}

	/* single channel series */
	if (not(menuinrefresh)) {
		setvar("_wavwin", _getcwin);
	}

	/* define start directory if it doesn't already exist */
	defvar("_wavpickdir", "");

	/* define channel mode */
	defvar("_wwavmode", 0);

	/* define scale mode */
	defvar("_wwavscale", 1);

	/* define channel mode */
	defvar("_wavbits", 8);

}


_wwavend()
{
	/* remember default directory */
	setvar("_wavpickdir", strrev(strfind(pathchar, strrev(_wavfname))));
}


_wwavlabel(mode)
{
	local str;

	if (mode) str = "Left Channel WAV Data:";
	else str = "Single Channel WAV Data:";

	return(str);
}

_wwavtip(mode)
{
	local str;

	if (mode) str = " Series for Left Channel WAV Data ";
	else str = " Series for Single Channel WAV Data ";

	return(str);
}

_wwavrate()
{
	local r;

	r = (eval(sprintf("length(%s)", _wavwin)) > 0) ? rate(eval(_wavwin)) : 1.0;
	return(r);
}

_wwavwrite(mode)
{
	local str, wavser1, wavser2, status;
	extern _wavwin, _rwavwin, _wavfname, _wavsrate, _wavbits, _wdisp;

	if (eval(sprintf("length(%s)", _wavwin)) == 0) {
		return(-1);
	}

	if (_wwavscale) {
		/* scale input */
		wavser1 = sprintf("normalize(%s, %d)", _wavwin,  _wavbits);
		wavser2 = sprintf("normalize(%s, %d)", _rwavwin, _wavbits);
	}
	else {
		wavser1 = _wavwin;
		wavser2 = _rwavwin;
	}

	if (mode) {
		/* stereo */
		str = sprintf('WriteStereo(%s, %s, "%s", %g, %d, %d)', wavser1, wavser2, _wavfname, _wavsrate, _wavbits, _wdisp);
	}
	else {
		/* mono */
		str = sprintf('WriteMono(%s, "%s", %g, %d, %d)', wavser1, _wavfname, _wavsrate, _wavbits, _wdisp);
	}

	status = eval(str);

	if (status > 0) {
		echo("Wav Write Complete");
	}

	return(status);
}



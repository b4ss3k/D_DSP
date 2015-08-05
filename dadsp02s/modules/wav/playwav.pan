! playwav.pan
@x10
@y0
@panel
@form
@justifylabels 3
@h ~help('Writing a WAV File',strcat(_WAVHOME, 'dspwav.hlp'))

{defvar("_wavtmp", getmiscpath(1, 1) + "temp.wav")}
{_wwavbeg(_wavtmp)}


         Play Series as WAV File
<>
{_wwavlabel(_wwavmode)}    <# * w{35} y{-2} t"{_wwavtip(_wwavmode)}" >~setvar("_wavwin","<{_frmcurr(_wavwin)}>")~_pickser(_wavwin)
Right Channel WAV Data:    <% * w{35} x{-1} y{-1} v{_wwavmode!=0} t{"' Series for Right Channel WAV Output '"} >~setvar("_rwavwin","<{_frmcurr(_rwavwin)}>")~_pickser(_rwavwin)
<L>
Channel Mode               <# r n  x{5} t{"' Single Channel for WAV Output | 2 Channels for WAV Output '"}  >~setvar("_wwavmode", <{_wwavmode}>)~<Mono><Stereo>
Bits Per Sample            <% r    x{-1} y{-1} t{"' Quantize from 0 to 255 | Quantize from -32768 to 32767 '"} > ~setvar("_wavbits",<{_wavbits}>)~<8><16>
Portion to Play            <% r n  x{-1} y{-1} t{"' Play Entire Series | Play Displayed Section of Series '"}       >~setvar("_wdisp",<{_wdisp}>)~<Entire><Displayed>
Sample Rate:               <% *  w{35} y{-2} t{"' Sample Rate for WAV Data '"}   > Hz     ~setvar("_wavsrate",<{_wwavrate()}>)~<11025><22050><44100>
Autoscale Input Series     <% c x{-1} y{-1} t{"' Automatically Scale Input Series to Conform to Bits Per Sample '"}>~setvar("_wwavscale", <{_wwavscale}>)~<0><1>
<L>
 &WAV Player: <* # w{85} t{"' Name of Program to Play WAV Data '"}>~setvar("_wavplyr", '<{getvar("_wavplyr")}>');setvar("_wavplyrset", 1)~pickflst(_wavplyr, "_wavplyrlst")
 &Browse...   <b # x{-1} y{-1} t{"' Select New File '"} > ~~if(strlen(temp = Pickfile(_wppickdir,"Select WAV Player Device", strescape("EXE Files(*.exe)\0*.exe\0All Files(*.*)\0*.*\0\0"),2)) > 0, setvar("_wavplyr", temp);setvar("_wavplyrset", 1);setvar("_wppickdir", strrev(strfind(pathchar, strrev(_wavplyr)))))
<L>
 &Temporary File Location: <* # w{85} t"{_wavtmp}" >~setvar("_wavtmp", '<{getvar("_wavtmp")}>')~pickflst(_wavtmp, "_wavnamelst")
 &Browse...  <b # x{-1} y{-1} t{"' Select New File '"} > ~~if(strlen(temp = Pickfile(_wavtmpdir,"Select Temp WAV File",strescape("WAV Files(*.wav)\0*.wav\0All Files(*.*)\0*.*\0\0"),2)) > 0, setvar("_wavtmp", temp);setvar("_wavtmpdir", strrev(strfind(pathchar, strrev(_wavtmp)))))
<L>

~if(_wavplyrset, _putwavplayer(_wavplyr))
~if(_pwavplay(_wwavmode) == 0, menureturn())
~_wwavend

@endform


_wwavbeg(fname)
{
	/* set default name to appear in dialog box */
	if (argc > 0 && strlen(fname) > 0) {
		/* use input filename */
		setvar("_wavtmp", fname);
		setvar("_wavtmpdir", strrev(strfind(pathchar, strrev(_wavtmp))));
	}
	else {
		/* just define the variable */
		defvar("_wavtmp", "");
	}

	/* single channel series */
	if (not(menuinrefresh)) {
		setvar("_wavwin", _getcwin);
		setvar("_wavplyrset", 0);
		setvar("_wppickdir", strrev(strfind(pathchar, strrev(_wavplyr))));
	}

	/* define start directory if it doesn't already exist */
	defvar("_wavtmpdir", "");

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
	setvar("_wavtmpdir", strrev(strfind(pathchar, strrev(_wavtmp))));
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

_pwavplay(mode)
{
	local str, wavser1, wavser2, status;
	extern _wavwin, _rwavwin, _wavsrate, _wavbits, _wdisp, _wavtmp;

	if (eval(sprintf("length(%s)", _wavwin)) > 0) {
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
			str = sprintf('PlayStereo(%s, %s, "%s", %g, %d, %d)', wavser1, wavser2, _wavtmp, _wavsrate, _wavbits, _wdisp);
		}
		else {
			/* mono */
			str = sprintf('PlayMono(%s, "%s", %g, %d, %d)', wavser1, _wavtmp, _wavsrate, _wavbits, _wdisp);
		}
	
		status = eval(str);

		if (status == 1) {
			echo("Wav Player Ready");
		}
	}
	else {
		message("PlayWav: Unknown Series", sprintf("No Data in %s", _wavwin), 4);
		status = 0;
	}

	return(status);
}



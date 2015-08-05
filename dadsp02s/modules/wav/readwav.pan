! ReadWAV.pan
@x10
@y0
@panel
@form
@justifylabels 3
@h ~help('Loading A WAV File',strcat(_WAVHOME, 'dspwav.hlp'))

{_rwavbeg(_wavfname)}

         Read WAV File
<>
 &File Name: <* % w{85} t"{_wavfname}" >~setvar("_wavfname", '<{getvar("_wavfname")}>')~pickflst(_wavfname, "_wavnamelst")
 &Browse...  <b # x{-1} y{-1} t{"' Select New File '"} > ~~if(strlen(temp = Pickfile(_wavpickdir,"Select WAV File",strescape("WAV Files(*.wav)\0*.wav\0All Files(*.*)\0*.*\0\0"),2)) > 0, setvar("_wavfname", temp);setvar("_wavpickdir", strrev(strfind(pathchar, strrev(_wavfname)))))
<L>
{_dwinstrS("w30")}
<L>

~if(_rwavfcheck(_wavfname) == 0, menureturn())
~_verifydlen
~if(_checkdwin, _readwav(_wavfname, _dwin))
~if(_checkdwin, _rwavend())

@endform



_rwavbeg(fname)
{
	/* set default name to appear in dialog box */
	if (argc > 0) {
		/* use input filename */
		setvar("_wavfname", fname);
		setvar("_wavpickdir", strrev(strfind(pathchar, strrev(_wavfname))));
	}
	else {
		/* just define the variable */
		defvar("_wavfname", "");
	}

	/* define start directory if it doesn't already exist */
	defvar("_wavpickdir", "");

}

_readwav(fname, dwin)
{
	local form;
	extern _readwaverr;

	_readwaverr = 0;

	if (strlen(fname) > 0) {
		form = sprintf('ReadWAV("%s")', fname);
		eval(sprintf("setwf(%s, '%s')", dwin, form));
	}

	return(_readwaverr == 0);
}

_rwavfcheck(fname)
{
	local status = 1;

	/* check file existence */
	if (fstat(fname) <= 0) {
		message("ReadWAV: File Not Found", sprintf("Cannot Open File %s", fname), 4);
		status = 0;
	}
	return(status);
}

_rwavend()
{
	/* remember default directory */
	setvar("_wavpickdir", strrev(strfind(pathchar, strrev(_wavfname))));
}

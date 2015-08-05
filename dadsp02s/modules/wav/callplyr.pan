! CallPlyr.pan
@x10
@y0
@panel
@form
@justifylabels 3
@h ~help('Calling A WAV Player Application',strcat(_WAVHOME, 'dspwav.hlp'))

{_pwavbeg(_wavplyr)}

         Set WAV Player
<>

 &WAV Player: <* # w{85} t{"' Name of Program to Play WAV Data '"}>~setvar("_wavplyr", '<{getvar("_wavplyr")}>')~pickflst(_wavplyr, "_wavplyrlst")
 &Browse...   <b # x{-1} y{-1} t{"' Select New File '"} > ~~if(strlen(temp = Pickfile(_wppickdir,"Select WAV Player Device", strescape("EXE Files(*.exe)\0*.exe\0All Files(*.*)\0*.*\0\0"),2)) > 0, setvar("_wavplyr", temp);setvar("_wppickdir", strrev(strfind(pathchar, strrev(_wavplyr)))))

<L>


~_pwavend()
~eval(sprintf('Run("%s")', _wavplyr))

@endform

_pwavbeg(fname)
{
	/* set default name to appear in dialog box */
	if (argc > 0) {
		/* use input filename */
		setvar("_wavplyr", fname);
		setvar("_wppickdir", strrev(strfind(pathchar, strrev(_wavplyr))));
	}
	else {
		/* just define the variable */
		defvar("_wavplyr", "mplayer.exe");
	}

	/* define start directory if it doesn't already exist */
	defvar("_wppickdir", getmiscpath(1, 2));

}


_pwavend()
{
	/* save name in cnf file */
	_putwavplayer(_wavplyr);

	/* remember default directory */
	setvar("_wppickdir", strrev(strfind(pathchar, strrev(_wavplyr))));

}

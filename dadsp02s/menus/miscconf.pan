! misconf.pan
@panel
@form

Misc

{defvar("_usespill", getconf("SPILL_FILE_DIR")!="")}
{setvar("_owstyle",  castint(getconf("GUI_WINDOW")));setvar("_wstyle", _owstyle);}
{setvar("_zwinsz",   castint(getconf("ZOOM_AUTOSIZE")));if(_zwinsz >= 4, setvar("_zwinsz", int(_zwinsz/2)+1))}
{setvar("_otstyle",  castint(getconf("TOOLBAR_STYLE")))}
{setvar("_ooem_enb", castint(getconf("OEM_ENABLED")))}
!<>
Startup Size       <r x{5} n        t{'" Start as Icon | Start Normal Size | Start Full Screen | Start without Displaying | Start using Previous Size "'}  >~setvar("_cshow", '<{_gcshow}>')~<Iconic><Normal><Full Screen><Hidden><Last Size>
Zoomed Window Size <r x{-1} y{-1} n t{'" Zoom Window to Previous Size | Zoom Window to Half Worksheet Size | Zoom Window to Actual Image Size or Half Worksheet if not Image | Zoom Window to Full Worksheet Size | Zoom Window to Actual Image Size or Full Worksheet if not Image "'}  >~setvar("_zwinsz", <{_zwinsz}>)~<Last Size><Half><Half or Image><Full><Full or Image>
Window Style       <r x{-1} y{-1} n t{'" Small Native GUI Window | Small Native GUI Window with Scrollbars | Fast, Custom Non-Overlapping Window with No Buttons | Native GUI Window with Buttons and Scrollbars | Native GUI Window with Buttons "'}>~setvar("_wstyle", _n2wstyle(<{_wstyle2n(_wstyle)}>))~<Standard><Standard with Scrollbars><Simple><Full with Scrollbars><Full no Scrollbars>
Toolbar Style      <r x{-1} y{-1} n t{'" Use 3D Toolbar Button Border | No Toolbar Button Border "'}  >~setvar("_tstyle", <{_otstyle}>)~<Raised><Flat><><><>
<>
  Session File Name: <w{60}         t{'" Name of Runtime Configuration File for Additions "'}  >~setconf("SESSION_FILENAME", '<{getconf("SESSION_FILENAME")}>')~_INLIT("Session File")
Ignore Session       <c x{-1} y{-1} t{'" Ignore Runtime Configuration Settings "'}             >~setvar("_ign",'<{getconf("IGNORE_SESSION")}>')~<0><1>

Spill File Location:     <w{60}              t{'" Location of Temporary Labbook Files "'}  >~setvar("_spilldir", fixslash('<{getconf("SPILL_FILE_DIR")}>'))~input(5)
     Use Spill File      <C x{-1} y{-1}      t{'" Use Temporary Labbook Location "'}       >~setvar("_usespill", <{_usespill}>)~<0><1>
Recently Used File List: <d{0} u{10} w{20}   t{'" Number of Worksheets Listed in File Menu "'}  >~setconf("MRU_NUM_FILES", '<{getconf("MRU_NUM_FILES")}>')~input(2, 0, 10)
Open Last Worksheet      <C x{-1} y{-1}      t{'" Open Last Internal Worksheet on Startup "'}  >~setvar("_olwks", '<{getconf("OPEN_LAST_WORKSHEET")=="1"}>')~<0><1>
Recently Used Dialog List: <d{0} u{10} w{20} t{'" Number of Dialogs Listed in Right Click Menu "'}  >~setconf("PDC_NUM_PANELS", '<{getconf("PDC_NUM_PANELS")}>')~input(2, 0, 10)
<>
Misc <L>
Beep                  <C             t{'" That Annoying Sound "'}                                >~setvar("_bp",'<{getconf("BEEP")}>')~<0><1>
Accept Leading =      <C x{-1} y{-1} t{'" Accept Excel Style Leading = in Line Editor "'}        >~setconf("ACCEPT_EQUALSIGN",'<{getconf("ACCEPT_EQUALSIGN")}>')~<0><1>
Uppercase First Char  <C x{-1} y{-1} t{'" Uppercase First Character Typed into Line Editor "'}   >~setconf("UPPERCASE_FIRST_CHAR",'<{getconf("UPPERCASE_FIRST_CHAR")}>')~<0><1>
Comma Continuation    <C             t{'" Accept Comma as Line Editor Continuation Character "'} >~setconf("ACCEPT_CONTINUATION",'<{getconf("ACCEPT_CONTINUATION")}>')~<0><1>
TeX Processing        <C x{-1} y{-1} t{'" Enable a Subset of TeX Greek and Math Symbols in Strings and Units "'}>~setconf("TEX_PROCESSING",'<{getconf("TEX_PROCESSING")}>')~<0><1>
Show OEM Logo         <C x{-1} y{-1} t{'" Display OEM Bitmap and Popup Menu "'}>~setvar("_oem_enb",<{_ooem_enb}>)~<0><1>

~_mc
~if(_usespill, setconf("SPILL_FILE_DIR", _spilldir), setconf("SPILL_FILE_DIR", ""))
~_scshow(_cshow);setconf("IGNORE_SESSION", _ign);setconf("BEEP", _bp);
~if(_tstyle != _otstyle, setvar("_rdraw", 1);setconf("TOOLBAR_STYLE", caststring(_tstyle)))
~setconf("GUI_WINDOW", caststring(_wstyle));
~if(_oem_enb != _ooem_enb, setvar("_rdraw", 1);setconf("OEM_ENABLED", caststring(_oem_enb)))
~if(_wstyle != _owstyle, setvar("_rdraw", 3));
~if(_zwinsz >= 3, _zwinsz += int(_zwinsz/2));setconf("ZOOM_AUTOSIZE", caststring(_zwinsz));
~setconf("OPEN_LAST_WORKSHEET",_olwks);
@endform


_n2wstyle(n)
{
	local s;

	switch (n) {
		case 0:
		default:
			s = 6;
			break;

		case 1:
			s = 7;
			break;

		case 2:
			s = 0;
			break;

		case 3:
			s = 2;
			break;

		case 4:
			s = 3;
			break;
	}
	return(s);
}


_wstyle2n(s)
{
	local n;

	switch (s) {
		case 6:
		default:
			n = 0;
			break;

		case 7:
			n = 1;
			break;

		case 0:
			n = 2;
			break;

		case 2:
			n = 3;
			break;

		case 3:
			n = 4;
			break;
	}
	return(n);
}


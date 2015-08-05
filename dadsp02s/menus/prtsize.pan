! prtsize.pan
! System Printing Page Size
@f{_fg1}
@b{_bg1}
@form
@panel

{setvar("_prnpwi", _prnpwm / 25.4)}
{setvar("_prnphi", _prnphm / 25.4)}
{setvar("_prntmm", _prntmi * 25.4)}
{setvar("_prnlmm", _prnlmi * 25.4)}
{setvar("_prnrmm", _prnrmi * 25.4)}
{setvar("_prnbmm", _prnbmi * 25.4)}

Page Size  

<>
Continuous Print      <% c              t{'" Print Continuously without Page Breaks "'   }   >~setvar("_prncontin", <{_prncontin}>)~<0><1>
{_defsetstr} <# b x{-1} y{-1}>~~_defprtp
<>
Page Size <L>
Width (in):     <# w{20} e{not(_prn_pwa)}               t{'" Page Width in Inches "'}       >~setvar("_prnpwi",  _tautoval("<{_gautoval(_prnpwi, _prn_pwa)}>"));setvar("_prnpwm", _prnpwi * 25.4)~input(1, 0)
{_automaticstr} <# c w{10} x{-1} y{-1}                  t{'" Use Printer Width "'}          >~setvar("_prn_pwa", <{_prn_pwa}>)~<0><1>
Width (mm):     <# w{20} e{not(_prn_pwa)} x{-1} y{- 1}  t{'" Page Width in Millimeters "'}  >~setvar("_prnpwm",  _tautoval("<{_gautoval(_prnpwm, _prn_pwa)}>"))~input(1, 0)
Height (in):    <# w{20} e{not(_prn_pha)}               t{'" Page Height in Inches "'}      >~setvar("_prnphi",  _tautoval("<{_gautoval(_prnphi, _prn_pha)}>"));setvar("_prnphm", _prnphi * 25.4)~input(1, 0)
{_automaticstr} <# c w{10} x{-1} y{-1}                  t{'" Use Printer Height "'}         >~setvar("_prn_pha", <{_prn_pha}>)~<0><1>
Height (mm):    <# w{20} e{not(_prn_pha)} x{-1} y{-1}   t{'" Page Height in Millimeters "'} >~setvar("_prnphm",  _tautoval("<{_gautoval(_prnphm, _prn_pha)}>"))~input(1, 0)
<>
Margins <L>
Top (in):    <# w{20}               t{'" Top Margin Height in Inches "'}         >~setvar("_prntmi", <{_prntmi}>)~input(1)
Top (mm):    <# w{20} x{-1} y{-1}   t{'" Top Margin Height in Millimeters "'}    >~setvar("_prntmm", <{_prntmm}>);setvar("_prntmi", _prntmm/25.4)~input(1, 0)
Bottom (in): <# w{20}               t{'" Bottom Margin Height in Inches "'}      >~setvar("_prnbmi", <{_prnbmi}>)~input(1)
Bottom (mm): <# w{20} x{-1} y{-1}   t{'" Bottom Margin Height in Millimeters "'} >~setvar("_prnbmm", <{_prnbmm}>);setvar("_prnbmi", _prnbmm/25.4)~input(1, 0)
Left (in):   <# w{20}               t{'" Left Margin Width in Inches "'}         >~setvar("_prnlmi", <{_prnlmi}>)~input(1)
Left (mm):   <# w{20} x{-1} y{-1}   t{'" Left Margin Width in Millimeters "'}    >~setvar("_prnlmm", <{_prnlmm}>);setvar("_prnlmi", _prnlmm/25.4)~input(1, 0)
Right (in):  <# w{20}               t{'" Right Margin Width in Inches "'}        >~setvar("_prnrmi", <{_prnrmi}>)~input(1)
Right (mm):  <# w{20} x{-1} y{-1}   t{'" Right Margin Width in Millimeters "'}   >~setvar("_prnrmm", <{_prnrmm}>);setvar("_prnrmi", _prnrmm/25.4)~input(1, 0)
~_mc

~_setprtp()

@endform

/* resets to menu to default printer settings */
_defprtp()
{
	extern _prncontin, _prnpwm, _prnphm, _prnpwi, _prnphi;
	extern _prn_pwa, _prn_pha;
	extern _prnlmi, _prnrmi, _prntmi, _prnbmi;

	/* use configurable defaults */
	_prncontin =  castint(getconfdefault("PRT_CONTINUOUS"));
	_prnpwm    =  castint(getconfdefault("PRT_PAGE_WIDTH"));
	_prnphm    =  castint(getconfdefault("PRT_PAGE_HEIGHT"));

	if (_prnpwm < 0) {
		_prnpwi = _prnpwm;
	}
	else {
		_prnpwi = _prnpwm / 25.4;
	}
	if (_prnphm < 0) {
		_prnphi = _prnphm;
	}
	else {
		_prnphi = _prnphm / 25.4;
	}
	_prn_pwa = _prnpwm < 0;
	_prn_pha = _prnphm < 0;

	_prnlmi = castreal(getconfdefault("PRT_XL"));
	_prnrmi = castreal(getconfdefault("PRT_XR"));
	_prntmi = castreal(getconfdefault("PRT_YT"));
	_prnbmi = castreal(getconfdefault("PRT_YB"));

}


_setprtp()
{
	local val;
	extern _prn_pwa, _prnpwm, _prnphm, _prncontin;

	setconf("PRT_CONTINUOUS", caststring(_prncontin));

	val = _prn_pwa ? -1 : _prnpwm;
	setconf("PRT_PAGE_WIDTH", caststring(val));

	val = _prn_pha ? -1 : _prnphm;
	setconf("PRT_PAGE_HEIGHT", caststring(val));

	setconf("prt_yt", caststring(_prntmi));
	setconf("prt_xl", caststring(_prnlmi));
	setconf("prt_xr", caststring(_prnrmi));
	setconf("prt_yb", caststring(_prnbmi));

}


_gautoval(x, auto)
{
	return((x < 0 || auto) ? _automaticstr : x);
}


_tautoval(str)
{
	local val;

	if (str == _automaticstr) {
		val = -1;
	}
	else {
		val = castreal(str);
	}
	return(val);
}

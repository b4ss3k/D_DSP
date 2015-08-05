! dde.pan
@panel
@apply
@form

{defvar("_ddeorgdtype", _EXCELSTR)}

    DDE

<>

DDE Enabled               <% c              t{'" Enable DDE Capability "'}                               >~setvar("_ddeenb",  <{_ddeenb}>)   ~<0><1>
Use Worksheet Topic       <% c x{-1} y{-1}  t{'" Use Worksheet Name as Primary DDE Topic for Copy Link"'}>~setvar("_ddewst",  <{_ddewst}>)   ~<0><1>
{_defsetstr}              <# b x{-1} y{-1} >~~_defdde

<>
Paste Link <L>
Autoscale Received Data   <% c              t{'" Autoscale Incoming Data for Paste Link "'}                             >~setvar("_ddeautos",<{_ddeautos}>) ~<0><1>
Append Received Data      <% c x{-1} y{-1}  t{'" Append Incoming Data to Destination Window for Paste Link "'}          >~setvar("_ddeapnd", <{_ddeapnd}>)  ~<0><1>
<>

Data Type: <% e{_ddedauto==0} w{35} j{3} t{'" Data Type for Incoming Data for Paste Link "'}>~setvar("_ddedtype", '<{_ddedtype}>');setvar("_ddeorgdtype", _ddedtype)~<{_EXCELSTR}><{_ASCIISTR}><{_SBYTESTR}><{_UBYTESTR}><{_SINTSTR}><{_UINTSTR}><{_LONGSTR}><{_ULONGSTR}><{_FLOATSTR}><{_DOUBLESTR}>
Automatic  <c # x{-1} y{-1} t{'" Automatically Detect Data Type "'}>~setvar("_ddedauto", <{_ddedauto}>);_ddesetauto(_ddedauto)~<0><1>
Timeout:   <% w{25} x{-1} y{-1} j{3} d{0} t{'" Timeout in Milliseconds for DDE Data Transfers "'}  >~setvar(_ddetimeo,"<{_ddetimeo}>")~input(2, 0)
<>

~_mc

~setconf("DDE_ENABLED", caststring(_ddeenb));
~setconf("DDE_WORKSHEET_TOPIC", caststring(_ddewst));
~setconf("DDE_OVERWRITE", caststring(not(_ddeapnd)));
~setconf("DDE_AUTOSCALE", caststring(_ddeautos));
~setconf("DDE_TIMEOUT", caststring(_ddetimeo));
~if(_ddedauto, setconf("DDE_DATATYPE", "-1"), setconf("DDE_DATATYPE", caststring(_ddetype2int(_ddedtype))))

@endform


/* get dde data type or automatic */
_gddedtype(dtype, auto)
{
	if (auto) dtype = _automaticstr;
	else dtype = _dtype2s(dtype);
	return(dtype);
}

_ddesetauto(auto)
{
	extern _ddedtype, _ddeorgdtype;

	if (auto) {
		_ddedtype = _automaticstr;
	}
	else {
		_ddedtype = _ddeorgdtype;
	}
}

_ddetype2int(intype)
{
	local outtype;

	switch (intype) {
		case _EXCELSTR:
			outtype = 100;
			break;

		case _ASCIISTR:
			outtype = 0;
			break;

		default:
			outtype = eval(_s2dtype(intype));
			break;
	}
	return(outtype);
}

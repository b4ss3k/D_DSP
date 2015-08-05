! ds.pan - dataset wizard
@form
@panel
@justifylabels 3
@h~help("loadseries")
!@focus 5

{defvar("_dsname",    strget(1, objectlist(3, 0, 1)))}
{setvar("_sername",    if(strlen(_dsname),strget(1, objectlist(4, 0, 1, _dsname)), ""))}
{setvar("_dslhlp", getcomment(_dsname+"."+_sername))} 
{setvar("_dslwiz", _dsname+"."+_sername)} 
{setvar("_dslinp", 0)}

{getlabpath+getlabname}

Series Name: <W{72} j{3} id{1}>~setvar("_dslwiz", "<{_dslwiz}>")~setvar("_dslinp", 1);input(5)
Info         <b  x{-1} y{-1} t{"' Series Information '"}>~~infobox(_dsname+"."+_sername)
<L>
Datasets: <* # l m{12} w{35} id{5}       +c>~setvar("_dsname", "<{_dsname}>")~objectlist(3, 0, 1)
Series:   <* % l m{12} w{35} x{-1} y{-1} +c>~setvar("_sername", "<{_sername}>");if(not(_dslinp),setvar("_dslwiz", _dsname+"."+_sername));setvar("_dslhlp", getcomment(eval(_dslwiz)));setcontrolvalue(1, _dslwiz)~objectlist(4, 0, 1, _dsname)
<y{-2}>
Comment:  <W{72} m2 j{3} -s{bitor(0x0040L,0x00200000L)}  >~noop("<{sprintf(" %-72s", (isdsname(_dslwiz)) ? _dslhlp : "")}>")~
<L>
 {_dwinstr}
<L>

! do not clear if dsname but no series name
~if(strlen(strget(3, _dslwiz, "."))==0, setcontrolvalue(1, formatdsname(_dslwiz), 2);menureturn();)

! used to check if popup was cancelled
~setvar("_menucleared", 0)

! parse statement to execute from the wizard file
!~_dslwiz = _dsname+"."+_sername

~_verifydwin("")
~if(_chkwinok, eval(sprintf("setwf(%s, '%s')", _dwin, _dslwiz)))

! execute statement
!~return(_dslwiz)

@endform


formatdsname(s)
{
	local name, ver;

	name = strget(1, s, ".");
	if (strlen(name) > 0) {
		ver = strget(2, s, ".");
		if (strlen(ver) == 0) {
			ver = 1;
		}
		else {
			ver = castint(ver);
		}
		if (ver <= 0) ver = 1;

		name = sprintf("%s.%d.", name, ver);
	}
	return(name);
}


isdsname(s)
{
	local status, ver;

	status = 0;

	if (strlen(strget(1, s, ".")) > 0) {
		ver = castint(strget(2, s, "."));
		if (ver > 0) {
			if (strlen(strget(3, s, ".")) > 0) {
				status = 1;
			}
		}
	}
	return(status);
}



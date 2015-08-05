! Readt.pan - input filename and datatype
@f{_fg1}
@b{_bg1}
@panel
@h
@fixed_editwidth 0
@justifylabel 3
{_funcstr}

{defvar("_rtlall", 1)}
{defvar("_rtcall", 1)}
{defvar("_rtnpts", "1")}
{defvar("_rtnumcol","1")}
{defvar("_rtclst",  "1")}
{defvar("_rtncol",  "1")}
{defvar("_rthex",   "0")}
{defvar("_rtsccol", "0")}

{if(_rtlall, setvar("_rtnumpts", "-1"), if(_rtnumpts=="-1",setvar("_rtnumpts", _rtnpts)))}
{if(_rtcall, setvar("_rtcollist", "-1");setvar("_rtnumcol", "-1"), if(_rtcollist=="-1",setvar("_rtcollist", _rtclst);setvar("_rtnumcol", _rtncol)))}

<>
 &File Name: <* # w{85} t"{_rtfname}">~setvar("_rtfname", '<{getvar("_rtfname")}>')~pickflst(_rtfname, "_rwfnamelst")
 &Browse...  <b # x{-1} y{-1} t{'" Select New File "'}   > ~~if(strlen(temp = Pickfile(_rtpickdir,"Select ASCII Data File",strescape("Data Files(*.dat)\0*.dat\0Text Files(*.txt)\0*.txt\0CSV Files(*.csv)\0*.csv\0All Files(*.*)\0*.*\0\0"),_rwflg)) > 0, setvar("_rtfname", temp);setvar("_rtpickdir", strrev(strfind(pathchar, strrev(_rtfname)))))
 <L>
       &Start Row:  <% d{1}  w{20} t{"' First Line to Read '"} >~setvar("_rtoffset", "<{_rtoffset}>")~_inint("Start Row")
   &Rows to Read:   <% x{-1} y{-1} e{_rtlall==0} d{1} w{20} t{"' Number of Lines to Read Beginning at Start Row '"} >~setvar("_rtnumpts", _fromall('<{_toall(_rtnumpts)}>'));if(_rtnumpts!="-1",setvar("_rtnpts",_rtnumpts))~input(2, 1)
   &All Rows        <# c  x{-1} y{-1} w{9} t{"' Read All Lines Beginning at Start Row '"}                >~setvar("_rtlall", <{_rtlall}>)~<0><1>
   &Treat File as Hex     <# c  x{-1} y{-1} t{"' Interpret Values as Hex Numbers '"} >~setvar("_rthex", '<{_rthex}>')~<0><1>

      T&otal Columns: <# d{1} e{_rtcall==0} t{"' Total Number of Data Columns in File '"}  w{20}>~setvar(_rtnumcol,_fromall("<{_toall(_rtnumcol)}>"));setvar("_rtcollist", "1");if(_rtnumcol!="-1",setvar("_rtncol",_rtnumcol))~INPUT(2, 1)
  &List of Columns to Read: <# * k x{-1} y{-1} e{_rtcall == 0} w{40}>~setvar("_rtcollist", _fromall("<{_toall(_rtcollist)}>"));if(_rtcollist!="-1",setvar("_rtclst",_rtcollist))~_numlist(numstr(_rtnumcol))
  A&ll Columns              <# c  x{-1} y{-1} j{16} t{"' Read All Columns Beginning at Start Column '"} >~setvar("_rtcall", <{_rtcall}>)~<0><1>
  S&can File for Columns    <# c  x{-1} y{-1} j{16} t{"' Pre-scan Entire File to Determine Number of Columns '"} >~setvar("_rtsccol", <{_rtsccol}>)~<0><1>
<L>
 &View       <b   t{'" View File Contents "'}> ~~if(strlen(_rtfname) > 0, menureturn();viewfile(caststring(_rtfname), 1, 100, 1, 1))
 &Preview    <b   x{-1} y{-1} t{'" Preview Result "'}    > ~~if(strlen(_rtfname) > 0, _prert(_rtfname, eval(_rtoffset), eval(_rtstartcol), eval(_rthex), (_rtcollist), _readt_delimiters, eval(_readt_skip_delimiters)))
<L>
{_dwinstrS("w20")}
<L>

~_verifydlen
~setvar("_pickfile_status", _chkwin)

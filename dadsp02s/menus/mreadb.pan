! Mreadb.pan - input filename and datatype
@f{_fg1}
@b{_bg1}
@panel
@h
@fixed_editwidth 0
@justifylabels 3
{_funcstr}
 &File Name: <* # w{85} t"{_rmbfname}" >~setvar("_rmbfname", '<{getvar("_rmbfname")}>')~pickflst(_rmbfname, "_rwfnamelst")
 &Browse     <b # x{-1} y{-1} t{"' Select New File '"} > ~~if(strlen(temp = Pickfile(_rmbpickdir,"Select Binary Data File",strescape("Data Files(*.dat)\0*.dat\0All Files(*.*)\0*.*\0\0"),_rwflg)) > 0, setvar("_rmbfname", temp);setvar("_rmbpickdir", strrev(strfind(pathchar, strrev(_rmbfname)))))
<L>
 B&inary Data Type:  <# w{30} t{"' Binary Data Format '"} >~setvar("_rmbdtype",_s2dtype('<{_dtype2s(_rmbdtype)}>'),1)~<{_SBYTESTR}><{_UBYTESTR}><{_SINTSTR}><{_UINTSTR}><{_LONGSTR}><{_ULONGSTR}><{_FLOATSTR}><{_DOUBLESTR}>
 &Swap Bytes         <% c x{-1} y{-1} t{"' Flip Low and High Bytes '"} >~setvar("_rmbswap", <{_rmbswap}>)~<0><1>
 &Number of Series:  < d{1} w{30} t{"' Total Number of Data Columns '"} >~setvar("_rmbnumser", '<{_rmbnumser}>')~_inint("Number of Series")
 File &Offset (Bytes): <% d{0} w{30} t{"' First Byte to Read '"} >~setvar("_rmboffset", "<{_rmboffset}>")~input(2, "File Offset", 0)
<L>
{_dwinstrS("W30")}
<L>

~_verifydlen
~setvar("_pickfile_status", _chkwin)

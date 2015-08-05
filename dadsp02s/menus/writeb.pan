! writeb.pan - write Binary table
@f{_fg1}
@b{_bg1}
@panel
@fixed_editwidth 0
@justifylabels 3
@h
{_funcstr}

{if(_wbser, _DEFSER1(sprintf("'%s'", _getcwin)))}

 &File Name: <* # w{85} t"{_wbfname}" >~setvar("_wbfname", '<{getvar("_wbfname")}>')~pickflst(_wbfname, "_rwfnamelst")
 &Browse...  <b # x{-1} y{-1} t{"' Select New File '"}> ~~if(strlen(temp = Pickfile(_wbpickdir,"Select ASCII Data File",strescape("Data Files(*.dat)\0*.dat\0*.txt\0All Files(*.*)\0*.*\0\0"),2)) > 0, setvar("_wbfname", temp);setvar("_wbpickdir", strrev(strfind(pathchar, strrev(_wbfname)))))
 <L>
     &Input Series: <* %  w{30}       t{"' Series to Write as Binary '"}                  >~_DEFSER1(strcat("'","<{_ser1}>","'"));setvar("_wbser", 0)~_pickser(_ser1)
 Binary &Data Type: <#    w{30}       t{"' Binary Data Format '"} >~setvar("_wbdtype",_s2dtype('<{_dtype2s(_wbdtype)}>'))~<{_SBYTESTR}><{_UBYTESTR}><{_SINTSTR}><{_UINTSTR}><{_LONGSTR}><{_ULONGSTR}><{_FLOATSTR}><{_DOUBLESTR}>
        S&wap Bytes <#  c x{-1} y{-1} t{"' Reverse Low and High Bytes '"}                  >~setvar("_wbswap",<{_wbswap}>)~<0><1>
 <L>
 &Preview    <b  t{"' Preview Result '"} > ~~_prewb(_ser1, _wbdtype)
 <>
 If File Already Exists:   <r % t{"' Ask to Overwrite File | Overwrite File Without Asking | Append to Existing File '"} >~setvar("_wbsmode",_sav2int("<{_int2sav(_wbsmode)}>"))~<{_promptstr}><{_overwritestr}><{_appendstr}>

~setvar("_pickfile_status", 1)
~_mc

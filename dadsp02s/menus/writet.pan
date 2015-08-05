! writet.pan - write ACSII table
@f{_fg1}
@b{_bg1}
@panel
@fixed_editwidth 0
@justifylabels 3
@h
{_funcstr}

{if(_wtser, _DEFSER1(sprintf("'%s'", _getcwin)))}

 &File Name: <* # w{85} t"{_wtfname}" >~setvar("_wtfname", '<{getvar("_wtfname")}>')~pickflst(_wtfname, "_rwfnamelst")
 &Browse...  <b # x{-1} y{-1} t{"' Select New File '"} > ~~if(strlen(temp = Pickfile(_wtpickdir,"Select ASCII Data File",strescape("Data Files(*.dat)\0*.dat\0Text Files(*.txt)\0*.txt\0All Files(*.*)\0*.*\0\0"),2)) > 0, setvar("_wtfname", temp);setvar("_wtpickdir", strrev(strfind(pathchar, strrev(_wtfname)))))
 <L>
 &Input Series: <* %  w{20} t{"' Series to Write as ASCII '"} >~_DEFSER1(strcat("'","<{_ser1}>","'"));setvar("_wtser", 0)~_pickser(_ser1)
 &Numeric Precision: <  % x{-1} y{-1} e{not(_wtdprec)} d{0} w{20} t{"' Digits after Decimal Point or Total Digits if Hex'"}>~setvar("_wtprec", <{_wtprec}>)~input(2, 0, 64)
 Use &Default Precision <c # x{-1} y{-1} t{"' Use Default Digits after Decimal Point '"}  >~setvar("_wtdprec", <{_wtdprec}>);if(_wtdprec, setvar("_wtprec", castint(getconf("DISPLAY_PRECISION"))))~<0><1>
 Write as &Hex Values   <c # x{-1} y{-1} t{"' Write Ouput as Hex Digits '"} >~setvar("_wthex", <{_wthex}>);~<0><1>
<L>
 Add Series &Comment         <c #             t{"' Add Comment to Header '"} > ~setvar("_wtcheader", <{_wtcheader}>);~<0><1>
 Add Series &Units           <c # x{-1} y{-1} t{"' Add Units to Header '"} >   ~setvar("_wtuheader", <{_wtuheader}>);~<0><2>
<L>
 &Preview    <b  t{"' Preview Result '"}> ~~_prewt(_ser1, _writet_delimiters, _wtprec, _wthex, bitor(_wtcheader,_wtuheader))
<>
 If File Already Exists:   <h r % t{"' Ask to Overwrite File | Overwrite File Without Asking | Append to Existing File '"} >~setvar("_wtsmode",_sav2int("<{_int2sav(_wtsmode)}>"))~<{_promptstr}><{_overwritestr}><{_appendstr}>

~setvar("_pickfile_status", 1)
~_mc

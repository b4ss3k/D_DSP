! Wtdelim.pan - writetable field delimiters
@f{_fg1}
@b{_bg1}
@panel
Column Delimiters
{_setwtdl(_wttab, _wtspace, _wtcomma, _wtsemi, _wtother, _wtotherstr);}

 <>
 &Tab         <c # w{15}       t{"' ASCII Code 9 '"}    >~_DEFWTTAB('<{_getwtdl(strescape("\t"))}>')~<0><1>
 &Comma       <c # x{-1} y{-1} t{"' ASCII Code 44 '"}   >~_DEFWTCOMMA('<{_getwtdl(",")}>')~<0><1>
 &Space       <c # w{15}       t{"' ASCII Code 32 '"}    >~_DEFWTSPACE('<{_getwtdl(" ")}>')~<0><1>
 S&emicolon   <c # x{-1} y{-1} t{"' ASCII Code 59 '"}    >~_DEFWTSEMI('<{_getwtdl(";")}>')~<0><1>
              <  # w{30}       e{_wtother}   >~_DEFWTOTHERSTR('<{_getwtos()}>')~_INLIT("Input Delimiter")
 &Other       <c # x{-1} y{-1} t{"' Custom Delimiters '"}    >~_DEFWTOTHER('<{_wtother}>')~<0><1>
 <L>
 &Preview     <b t{"' Preview Result '"}> ~~_prewt(_ser1, _writet_delimiters, _wtprec, _wthex, bitor(_wtcheader,_wtuheader))
 <L>
